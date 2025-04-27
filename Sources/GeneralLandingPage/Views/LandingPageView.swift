import SwiftUI

/// 引导页主视图
public struct LandingPageView: View {
    /// 视图模型
    @StateObject private var viewModel: LandingPageViewModel
    /// 水平拖动手势状态
    @GestureState private var dragOffset: CGFloat = 0
    
    public init(pages: [LandingPageData], configuration: LandingConfiguration) {
        _viewModel = StateObject(wrappedValue: LandingPageViewModel(
            pages: pages,
            configuration: configuration
        ))
    }
    
    public var body: some View {
        GeometryReader { geometry in
            if viewModel.shouldShowLandingPage {
                ZStack {
                    // 页面内容
                    TabView(selection: Binding(
                        get: { viewModel.currentPageIndex },
                        set: { viewModel.moveToPage($0) }
                    )) {
                        ForEach(Array(viewModel.pages.enumerated()), id: \.element.id) { index, page in
                            LandingItemView(page: page, theme: viewModel.configuration.theme)
                                .tag(index)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .animation(.easeInOut, value: viewModel.currentPageIndex)
                    
                    // 控制按钮
                    VStack {
                        if viewModel.configuration.showSkipButton {
                            HStack {
                                Spacer()
                                Button(action: viewModel.skipLandingPage) {
                                    Text("跳过")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(viewModel.configuration.primaryColor)
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(
                                            Capsule()
                                                .stroke(viewModel.configuration.primaryColor, lineWidth: 1)
                                        )
                                }
                                .padding(.trailing, 20)
                                .padding(.top, 20)
                            }
                        }
                        
                        Spacer()
                        
                        bottomControls
                    }
                }
                .gesture(dragGesture(geometry: geometry))
            }
        }
    }
    
    // MARK: - Private Views
    
    private var bottomControls: some View {
        VStack(spacing: 24) {
            if viewModel.configuration.showPageIndicator {
                PageIndicatorView(
                    pageCount: viewModel.pages.count,
                    currentIndex: viewModel.currentPageIndex,
                    primaryColor: viewModel.configuration.primaryColor
                )
            }
            
            // 仅在最后一页显示开始按钮
            if viewModel.currentPageIndex == viewModel.pages.count - 1 {
                startButton
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 40)
    }
    
    /// 开始按钮
    private var startButton: some View {
        Button(action: viewModel.completeLandingPage) {
            Text("开始使用")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(viewModel.configuration.primaryColor)
                )
        }
        .accessibilityLabel("开始使用应用")
    }
    
    // MARK: - Private Methods
    
    /// 创建拖动手势
    private func dragGesture(geometry: GeometryProxy) -> some Gesture {
        DragGesture()
            .updating($dragOffset) { value, state, _ in
                state = value.translation.width
            }
            .onEnded { value in
                let dragThreshold = geometry.size.width * 0.25
                let draggedRight = value.translation.width > dragThreshold
                let draggedLeft = value.translation.width < -dragThreshold
                
                if draggedLeft {
                    viewModel.moveToNextPage()
                } else if draggedRight {
                    viewModel.moveToPreviousPage()
                }
            }
    }
}

// MARK: - Preview Provider

#if DEBUG
struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView(
            pages: LandingPageData.examples,
            configuration: LandingConfiguration()
        )
    }
}
#endif 