import SwiftUI
import Combine

/// 引导页视图模型
@MainActor
public final class LandingPageViewModel: ObservableObject {
    // MARK: - Published Properties
    
    /// 当前页面索引
    @Published public private(set) var currentPageIndex: Int = 0
    /// 是否显示引导页
    @Published public private(set) var shouldShowLandingPage: Bool = false
    /// 是否正在自动播放
    @Published public private(set) var isAutoPlaying: Bool = false
    
    // MARK: - Properties
    
    /// 引导页数据
    public let pages: [LandingPageData]
    /// 配置选项
    public let configuration: LandingConfiguration
    /// 自动播放定时器
    private var autoPlayTimer: AnyCancellable?
    /// 用户默认设置存储键
    private let userDefaultsKey: String
    
    // MARK: - Initialization
    
    public init(pages: [LandingPageData], configuration: LandingConfiguration) {
        self.pages = pages
        self.configuration = configuration
        self.userDefaultsKey = "landing_page_shown_\(configuration.persistenceIdentifier)"
        
        // 检查是否需要显示引导页
        checkShouldShowLandingPage()
        
        // 如果配置了自动播放，启动定时器
        setupAutoPlayIfNeeded()
    }
    
    // MARK: - Public Methods
    
    /// 移动到下一页
    public func moveToNextPage() {
        guard currentPageIndex < pages.count - 1 else {
            if configuration.autoPlayConfiguration?.isLooping == true {
                currentPageIndex = 0
            } else {
                Task { @MainActor in
                    stopAutoPlay()
                }
            }
            return
        }
        withAnimation {
            currentPageIndex += 1
        }
    }
    
    /// 移动到上一页
    public func moveToPreviousPage() {
        guard currentPageIndex > 0 else { return }
        withAnimation {
            currentPageIndex -= 1
        }
    }
    
    /// 移动到指定页面
    public func moveToPage(_ index: Int) {
        guard index >= 0 && index < pages.count else { return }
        withAnimation {
            currentPageIndex = index
        }
    }
    
    /// 跳过引导页
    public func skipLandingPage() {
        markLandingPageAsShown()
        withAnimation {
            shouldShowLandingPage = false
        }
    }
    
    /// 完成引导页
    public func completeLandingPage() {
        markLandingPageAsShown()
        withAnimation {
            shouldShowLandingPage = false
        }
    }
    
    /// 强制显示引导页
    public func forceShowLandingPage() {
        withAnimation {
            shouldShowLandingPage = true
        }
    }
    
    // MARK: - Private Methods
    
    /// 检查是否需要显示引导页
    private func checkShouldShowLandingPage() {
        let hasShown = UserDefaults.standard.bool(forKey: userDefaultsKey)
        shouldShowLandingPage = !hasShown
    }
    
    /// 标记引导页已显示
    private func markLandingPageAsShown() {
        UserDefaults.standard.set(true, forKey: userDefaultsKey)
    }
    
    /// 设置自动播放（如果需要）
    private func setupAutoPlayIfNeeded() {
        guard let autoPlayConfig = configuration.autoPlayConfiguration,
              autoPlayConfig.isEnabled else { return }
        
        startAutoPlay()
    }
    
    /// 开始自动播放
    private func startAutoPlay() {
        guard autoPlayTimer == nil else { return }
        
        isAutoPlaying = true
        autoPlayTimer = Timer.publish(
            every: configuration.autoPlayConfiguration?.interval ?? 3.0,
            on: .main,
            in: .common
        )
        .autoconnect()
        .sink { [weak self] _ in
            self?.moveToNextPage()
        }
    }
    
    /// 停止自动播放
    private func stopAutoPlay() {
        autoPlayTimer?.cancel()
        autoPlayTimer = nil
        isAutoPlaying = false
    }
    
    // MARK: - Deinitialization
    
    deinit {
        autoPlayTimer?.cancel()
        autoPlayTimer = nil
    }
} 