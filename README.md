# GeneralLandingPage

GeneralLandingPage 是一个用于创建 iOS 应用引导页的 Swift Package，提供了丰富的自定义选项和动画效果。

## 功能特点

- 支持多页面轮播展示
- 自定义页面内容（图片、文字、动画）
- 支持跳过功能
- 页面指示器
- 首次启动自动显示，后续启动不再显示
- 持久化状态管理
- 自定义主题
- 支持多种转场动画
- 自动播放支持

## 系统要求

- iOS 16.0+
- Swift 5.5+
- Xcode 14.0+

## 安装方法

### Swift Package Manager

在 Xcode 中，选择 File > Add Packages，然后输入以下地址：

```
https://github.com/goldwish1/GeneralLandingPage.git
```

## 使用方法

### 基本使用

```swift
import GeneralLandingPage

// 1. 创建引导页数据
let pages = [
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
    )
]

// 2. 创建配置
let configuration = LandingConfiguration(
    persistenceIdentifier: "app_v1",
    primaryColor: .blue,
    showSkipButton: true,
    showPageIndicator: true,
    theme: .standard
)

// 3. 显示引导页
LandingPageView(pages: pages, configuration: configuration)
```

### 自定义主题

```swift
// 使用预定义主题
let configuration = LandingConfiguration(
    persistenceIdentifier: "app_v1",
    primaryColor: .purple,
    theme: .dark
)

// 或创建自定义主题
let customTheme = LandingTheme(
    backgroundColor: Color(.systemBackground),
    titleColor: .primary,
    descriptionColor: .secondary
)
```

### 启用自动播放

```swift
let configuration = LandingConfiguration(
    persistenceIdentifier: "app_v1",
    primaryColor: .blue,
    autoPlayConfiguration: LandingAutoPlayConfiguration(
        isEnabled: true,
        interval: 3.0,
        isLooping: true
    )
)
```

### 持久化管理

```swift
// 检查是否显示过
let hasShown = LandingStorage.shared.hasShownLandingPage(identifier: "app_v1")

// 重置显示状态
LandingStorage.shared.resetLandingPage(identifier: "app_v1")

// 重置所有引导页
LandingStorage.shared.resetAllLandingPages()
```

## 使用 Cursor AI 快速集成

### 前置条件
1. 确保已将 GeneralLandingPage package 添加到您的 Cursor 项目文件夹中
2. 在 Xcode 中已经通过 SPM 成功导入了该包

### 示例提示词
如果您正在使用 Cursor AI，可以使用以下提示词快速完成集成：

```
这是我们之前项目做的一个landing组件，现在我们要为我们的IOS APP test1增加landing page，请参照示例项目进行适配，我们现在在我们IOS项目的根目录，我们需要：
* 创建一个新的View来使用LandingPageView
* 修改App的入口文件来集成这个Landing页面
```

Cursor AI 将帮助您：
1. 创建适配您项目的 LandingPageView
2. 在合适的位置集成引导页面
3. 配置必要的参数和状态管理

### 推荐的集成步骤
1. 首先创建引导页面视图
2. 配置引导页数据和主题
3. 在 App 入口处添加状态管理
4. 测试引导页显示逻辑

## 组件结构

### LandingPageData

页面数据模型，定义单个引导页的内容：
- `title`: 标题
- `description`: 描述文本
- `imageName`: 图片名称
- `customView`: 自定义视图（可选）
- `animationType`: 动画类型（可选）

### LandingConfiguration

配置选项，用于自定义引导页的行为和外观：
- `persistenceIdentifier`: 持久化标识符
- `primaryColor`: 主题色
- `showSkipButton`: 是否显示跳过按钮
- `showPageIndicator`: 是否显示页面指示器
- `theme`: 自定义主题
- `autoPlayConfiguration`: 自动播放配置

### LandingTheme

主题配置，用于自定义视觉样式：
- `backgroundColor`: 背景颜色
- `titleColor`: 标题颜色
- `descriptionColor`: 描述文本颜色

## 动画效果

支持以下预定义动画类型：
- `fade`: 淡入淡出
- `slide`: 滑动
- `scale`: 缩放
- `custom`: 自定义动画

## 最佳实践

1. 为每个版本的引导页使用唯一的 `persistenceIdentifier`
2. 使用系统图标作为图片资源的备选项
3. 在 SwiftUI 的 App 入口处初始化引导页
4. 使用动画效果增强用户体验
5. 为不同设备和屏幕尺寸提供适当的布局调整

## 示例项目

查看 `Examples` 目录获取更多使用示例：
- 默认样式示例
- 自定义主题示例
- 自动播放示例

## 许可证

MIT License 