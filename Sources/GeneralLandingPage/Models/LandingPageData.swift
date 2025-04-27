import SwiftUI

/// 引导页数据模型
public struct LandingPageData: Identifiable {
    /// 唯一标识符
    public let id: UUID
    /// 标题
    public let title: String
    /// 描述文本
    public let description: String
    /// 图片名称
    public let imageName: String
    /// 自定义视图（可选）
    public let customView: AnyView?
    /// 动画类型（可选）
    public let animationType: LandingAnimationType?
    
    public init(
        id: UUID = UUID(),
        title: String,
        description: String,
        imageName: String,
        customView: AnyView? = nil,
        animationType: LandingAnimationType? = nil
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.imageName = imageName
        self.customView = customView
        self.animationType = animationType
    }
}

/// 引导页动画类型
public enum LandingAnimationType: String, Codable {
    case fade
    case slide
    case scale
    case custom
}

extension LandingPageData {
    /// 创建示例数据
    public static var examples: [LandingPageData] {
        [
            LandingPageData(
                title: "欢迎使用",
                description: "开始你的学习之旅",
                imageName: "landing_welcome",
                animationType: .fade
            ),
            LandingPageData(
                title: "智能记忆",
                description: "科学的记忆方法",
                imageName: "landing_memory",
                animationType: .slide
            ),
            LandingPageData(
                title: "开始使用",
                description: "让我们开始吧",
                imageName: "landing_start",
                animationType: .scale
            )
        ]
    }
}

// MARK: - Equatable

extension LandingPageData: Equatable {
    public static func == (lhs: LandingPageData, rhs: LandingPageData) -> Bool {
        lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.description == rhs.description &&
        lhs.imageName == rhs.imageName &&
        lhs.animationType == rhs.animationType
        // 注意：我们不比较customView，因为AnyView不支持相等性比较
    }
} 