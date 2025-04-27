import SwiftUI

/// 引导页动画工具类
public enum LandingAnimations {
    /// 获取指定类型的转场动画
    /// - Parameter type: 动画类型
    /// - Returns: 转场动画
    public static func transition(for type: LandingAnimationType?) -> AnyTransition {
        switch type {
        case .fade:
            return fadeTransition
        case .slide:
            return slideTransition
        case .scale:
            return scaleTransition
        case .custom, .none:
            return defaultTransition
        }
    }
    
    /// 获取指定类型的视图动画
    /// - Parameter type: 动画类型
    /// - Returns: 视图动画
    public static func animation(for type: LandingAnimationType?) -> Animation {
        switch type {
        case .fade:
            return .easeInOut(duration: 0.3)
        case .slide:
            return .spring(response: 0.3, dampingFraction: 0.8)
        case .scale:
            return .spring(response: 0.4, dampingFraction: 0.7)
        case .custom, .none:
            return .default
        }
    }
    
    // MARK: - Private Properties
    
    /// 淡入淡出转场
    private static var fadeTransition: AnyTransition {
        .opacity.combined(with: .scale(scale: 0.8))
    }
    
    /// 滑动转场
    private static var slideTransition: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .move(edge: .leading).combined(with: .opacity)
        )
    }
    
    /// 缩放转场
    private static var scaleTransition: AnyTransition {
        .scale(scale: 0.8)
            .combined(with: .opacity)
            .animation(.spring(response: 0.4, dampingFraction: 0.7))
    }
    
    /// 默认转场
    private static var defaultTransition: AnyTransition {
        .opacity
    }
    
    // MARK: - Animation Modifiers
    
    /// 页面切换动画修饰器
    public struct PageTransition: ViewModifier {
        let type: LandingAnimationType?
        
        public func body(content: Content) -> some View {
            content
                .transition(LandingAnimations.transition(for: type))
                .animation(LandingAnimations.animation(for: type), value: type)
        }
    }
}

// MARK: - View Extensions

public extension View {
    /// 应用引导页转场动画
    /// - Parameter type: 动画类型
    /// - Returns: 应用了动画的视图
    func landingTransition(_ type: LandingAnimationType?) -> some View {
        modifier(LandingAnimations.PageTransition(type: type))
    }
} 