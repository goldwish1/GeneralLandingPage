import SwiftUI

/// 引导页单个页面视图
struct LandingItemView: View {
    /// 页面数据
    let page: LandingPageData
    /// 主题配置
    let theme: LandingTheme
    
    var body: some View {
        VStack(spacing: 0) {
            // 图片区域
            imageSection
                .frame(maxHeight: .infinity)
            
            // 文本区域
            textSection
                .padding(.horizontal, 32)
                .padding(.bottom, 120)
        }
        .background(theme.backgroundColor)
    }
    
    // MARK: - Private Views
    
    private var imageSection: some View {
        Image(page.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.horizontal, 32)
            .padding(.top, 80)
    }
    
    private var textSection: some View {
        VStack(spacing: 16) {
            Text(page.title)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(theme.titleColor)
                .multilineTextAlignment(.center)
            
            if let description = page.description {
                Text(description)
                    .font(.system(size: 16))
                    .foregroundColor(theme.descriptionColor)
                    .multilineTextAlignment(.center)
            }
        }
        .padding(.top, 48)
    }
}

// MARK: - Preview Provider

#if DEBUG
struct LandingItemView_Previews: PreviewProvider {
    static var previews: some View {
        LandingItemView(
            page: LandingPageData.examples[0],
            theme: LandingTheme()
        )
    }
}
#endif 