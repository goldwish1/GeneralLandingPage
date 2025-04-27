import SwiftUI

/// 页面指示器视图
struct PageIndicatorView: View {
    /// 总页数
    let pageCount: Int
    /// 当前页码索引
    let currentIndex: Int
    /// 主色调
    let primaryColor: Color
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<pageCount, id: \.self) { index in
                Circle()
                    .fill(index == currentIndex ? primaryColor : primaryColor.opacity(0.3))
                    .frame(width: 8, height: 8)
                    .animation(.easeInOut, value: currentIndex)
            }
        }
    }
}

// MARK: - Preview Provider

#if DEBUG
struct PageIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        PageIndicatorView(
            pageCount: 3,
            currentIndex: 1,
            primaryColor: .blue
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
#endif 