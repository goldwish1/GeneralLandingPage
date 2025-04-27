import SwiftUI
@testable import GeneralLandingPage

/// Landing Page测试工具类
enum LandingPageTestUtils {
    /// 创建测试用的页面数据
    static func createTestPages() -> [LandingPageData] {
        [
            LandingPageData(
                title: "测试页面1",
                description: "这是第一个测试页面",
                imageName: "test_image_1",
                animationType: .fade
            ),
            LandingPageData(
                title: "测试页面2",
                description: "这是第二个测试页面",
                imageName: "test_image_2",
                animationType: .slide
            ),
            LandingPageData(
                title: "测试页面3",
                description: "这是第三个测试页面",
                imageName: "test_image_3",
                animationType: .scale
            )
        ]
    }
    
    /// 创建测试用的配置
    static func createTestConfiguration(
        identifier: String = "test",
        autoPlay: Bool = false
    ) -> LandingConfiguration {
        LandingConfiguration(
            persistenceIdentifier: identifier,
            primaryColor: .blue,
            showSkipButton: true,
            showPageIndicator: true,
            theme: .standard,
            autoPlayConfiguration: autoPlay ? LandingAutoPlayConfiguration(
                isEnabled: true,
                interval: 0.1,
                isLooping: true
            ) : nil
        )
    }
    
    /// 创建测试用的视图模型
    static func createTestViewModel(
        identifier: String = "test",
        autoPlay: Bool = false
    ) -> LandingPageViewModel {
        LandingPageViewModel(
            pages: createTestPages(),
            configuration: createTestConfiguration(
                identifier: identifier,
                autoPlay: autoPlay
            )
        )
    }
    
    /// 创建测试用的存储实例
    static func createTestStorage() -> LandingStorage {
        let userDefaults = UserDefaults(suiteName: #file)!
        userDefaults.removePersistentDomain(forName: #file)
        return LandingStorage.createForTesting(userDefaults: userDefaults)
    }
    
    /// 创建测试用的视图
    static func createTestView(
        identifier: String = "test",
        autoPlay: Bool = false
    ) -> LandingPageView {
        LandingPageView(
            pages: createTestPages(),
            configuration: createTestConfiguration(
                identifier: identifier,
                autoPlay: autoPlay
            )
        )
    }
} 