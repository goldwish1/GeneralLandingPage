import SwiftUI
import GeneralLandingPage

@main
struct BasicExampleApp: App {
    @State private var showLandingPage = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                // 主内容视图
                ContentView()
                
                // 引导页
                if showLandingPage {
                    LandingPageView(
                        pages: examplePages,
                        configuration: exampleConfiguration
                    )
                }
            }
        }
    }
    
    // 示例页面数据
    private var examplePages: [LandingPageData] {
        [
            LandingPageData(
                title: "欢迎使用",
                description: "这是一个使用GeneralLandingPage创建的示例应用",
                imageName: "landing_welcome",
                animationType: .fade
            ),
            LandingPageData(
                title: "功能展示",
                description: "展示引导页的各种功能和动画效果",
                imageName: "landing_features",
                animationType: .slide
            ),
            LandingPageData(
                title: "开始使用",
                description: "让我们开始探索吧",
                imageName: "landing_start",
                animationType: .scale
            )
        ]
    }
    
    // 示例配置
    private var exampleConfiguration: LandingConfiguration {
        LandingConfiguration(
            persistenceIdentifier: "example_v1",
            primaryColor: .blue,
            showSkipButton: true,
            showPageIndicator: true,
            theme: .standard,
            autoPlayConfiguration: LandingAutoPlayConfiguration(
                isEnabled: true,
                interval: 3.0,
                isLooping: false
            )
        )
    }
}

// 示例内容视图
struct ContentView: View {
    var body: some View {
        VStack {
            Text("示例应用")
                .font(.largeTitle)
                .padding()
            
            Text("这是主内容视图")
                .font(.title)
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
} 