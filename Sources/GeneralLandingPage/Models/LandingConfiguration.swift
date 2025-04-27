import SwiftUI

/// 引导页配置模型
public struct LandingConfiguration {
    /// 主题色
    public let primaryColor: Color
    /// 是否显示跳过按钮
    public let showSkipButton: Bool
    /// 是否显示页面指示器
    public let showPageIndicator: Bool
    /// 自动播放配置
    public let autoPlayConfiguration: LandingAutoPlayConfiguration?
    /// 自定义主题
    public let theme: LandingTheme
    /// 持久化标识符（用于区分不同版本的引导页）
    public let persistenceIdentifier: String
    
    public init(
        persistenceIdentifier: String = "default",
        primaryColor: Color = .blue,
        showSkipButton: Bool = true,
        showPageIndicator: Bool = true,
        theme: LandingTheme = .standard,
        autoPlayConfiguration: LandingAutoPlayConfiguration? = nil
    ) {
        self.primaryColor = primaryColor
        self.showSkipButton = showSkipButton
        self.showPageIndicator = showPageIndicator
        self.autoPlayConfiguration = autoPlayConfiguration
        self.theme = theme
        self.persistenceIdentifier = persistenceIdentifier
    }
}

/// 自动播放配置
public struct LandingAutoPlayConfiguration {
    /// 是否启用自动播放
    public let isEnabled: Bool
    /// 每页停留时间（秒）
    public let interval: TimeInterval
    /// 是否循环播放
    public let isLooping: Bool
    
    public init(
        isEnabled: Bool = false,
        interval: TimeInterval = 3.0,
        isLooping: Bool = false
    ) {
        self.isEnabled = isEnabled
        self.interval = interval
        self.isLooping = isLooping
    }
}

/// 引导页主题
public struct LandingTheme {
    /// 背景颜色
    public let backgroundColor: Color
    /// 标题颜色
    public let titleColor: Color
    /// 描述文本颜色
    public let descriptionColor: Color
    
    public init(
        backgroundColor: Color = .white,
        titleColor: Color = .primary,
        descriptionColor: Color = .secondary
    ) {
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        self.descriptionColor = descriptionColor
    }
    
    /// 标准亮色主题
    public static let standard = LandingTheme(
        backgroundColor: Color(.systemBackground),
        titleColor: .primary,
        descriptionColor: .secondary
    )
    
    /// 深色主题
    public static let dark = LandingTheme(
        backgroundColor: Color(.systemBackground),
        titleColor: .white,
        descriptionColor: .gray
    )
    
    /// 蓝色主题
    public static let blue = LandingTheme(
        backgroundColor: Color.blue.opacity(0.1),
        titleColor: .blue,
        descriptionColor: .primary
    )
}

/// 按钮样式
public enum LandingButtonStyle {
    case `default`
    case rounded
    case capsule
    case custom(AnyView)
} 