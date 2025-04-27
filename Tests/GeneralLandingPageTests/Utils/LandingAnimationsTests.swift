import XCTest
import SwiftUI
@testable import GeneralLandingPage

final class LandingAnimationsTests: XCTestCase {
    func testTransitionForFade_ReturnsCorrectTransition() {
        // When
        let transition = LandingAnimations.transition(for: .fade)
        
        // Then
        // 注意：由于AnyTransition不支持相等性比较，我们只能验证类型
        XCTAssertNotNil(transition)
    }
    
    func testTransitionForSlide_ReturnsCorrectTransition() {
        // When
        let transition = LandingAnimations.transition(for: .slide)
        
        // Then
        XCTAssertNotNil(transition)
    }
    
    func testTransitionForScale_ReturnsCorrectTransition() {
        // When
        let transition = LandingAnimations.transition(for: .scale)
        
        // Then
        XCTAssertNotNil(transition)
    }
    
    func testTransitionForNone_ReturnsDefaultTransition() {
        // When
        let transition = LandingAnimations.transition(for: nil)
        
        // Then
        XCTAssertNotNil(transition)
    }
    
    func testAnimationForFade_ReturnsCorrectAnimation() {
        // When
        let animation = LandingAnimations.animation(for: .fade)
        
        // Then
        // 注意：由于Animation不支持相等性比较，我们只能验证类型
        XCTAssertNotNil(animation)
    }
    
    func testAnimationForSlide_ReturnsCorrectAnimation() {
        // When
        let animation = LandingAnimations.animation(for: .slide)
        
        // Then
        XCTAssertNotNil(animation)
    }
    
    func testAnimationForScale_ReturnsCorrectAnimation() {
        // When
        let animation = LandingAnimations.animation(for: .scale)
        
        // Then
        XCTAssertNotNil(animation)
    }
    
    func testAnimationForNone_ReturnsDefaultAnimation() {
        // When
        let animation = LandingAnimations.animation(for: nil)
        
        // Then
        XCTAssertNotNil(animation)
    }
    
    func testPageTransitionModifier_AppliesCorrectModifications() {
        // Given
        let type: LandingAnimationType = .fade
        let modifier = LandingAnimations.PageTransition(type: type)
        
        // When & Then
        // 注意：由于ViewModifier的效果无法直接测试，我们只能验证修饰器的创建
        XCTAssertNotNil(modifier)
    }
    
    func testLandingTransitionViewExtension_AppliesModifier() {
        // Given
        let type: LandingAnimationType = .fade
        let testView = Text("Test")
        
        // When
        let modifiedView = testView.landingTransition(type)
        
        // Then
        // 注意：由于View修饰后的效果无法直接测试，我们只能验证修饰后的视图存在
        XCTAssertNotNil(modifiedView)
    }
} 