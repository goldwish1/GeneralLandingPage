import Foundation

/// 引导页存储工具类
public final class LandingStorage {
    /// 单例实例
    public static let shared = LandingStorage()
    
    /// UserDefaults实例
    private let userDefaults: UserDefaults
    /// 存储键前缀
    private let keyPrefix = "com.general.landing."
    
    private init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    /// 检查指定标识符的引导页是否已显示
    /// - Parameter identifier: 引导页标识符
    /// - Returns: 是否已显示
    public func hasShownLandingPage(identifier: String) -> Bool {
        userDefaults.bool(forKey: storageKey(for: identifier))
    }
    
    /// 标记指定标识符的引导页为已显示
    /// - Parameter identifier: 引导页标识符
    public func markLandingPageAsShown(identifier: String) {
        userDefaults.set(true, forKey: storageKey(for: identifier))
    }
    
    /// 重置指定标识符的引导页显示状态
    /// - Parameter identifier: 引导页标识符
    public func resetLandingPage(identifier: String) {
        userDefaults.removeObject(forKey: storageKey(for: identifier))
    }
    
    /// 重置所有引导页显示状态
    public func resetAllLandingPages() {
        let keys = userDefaults.dictionaryRepresentation().keys
        keys.filter { $0.hasPrefix(keyPrefix) }
            .forEach { userDefaults.removeObject(forKey: $0) }
    }
    
    /// 获取存储键
    /// - Parameter identifier: 引导页标识符
    /// - Returns: 完整的存储键
    private func storageKey(for identifier: String) -> String {
        keyPrefix + "shown." + identifier
    }
}

// MARK: - Testing Support

#if DEBUG
extension LandingStorage {
    /// 创建测试实例
    /// - Parameter userDefaults: 用于测试的UserDefaults实例
    /// - Returns: 测试用的存储工具实例
    static func createForTesting(userDefaults: UserDefaults) -> LandingStorage {
        LandingStorage(userDefaults: userDefaults)
    }
}
#endif 