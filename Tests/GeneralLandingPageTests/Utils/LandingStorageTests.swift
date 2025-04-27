import XCTest
@testable import GeneralLandingPage

final class LandingStorageTests: XCTestCase {
    var storage: LandingStorage!
    var userDefaults: UserDefaults!
    
    override func setUp() {
        super.setUp()
        userDefaults = UserDefaults(suiteName: #file)
        userDefaults.removePersistentDomain(forName: #file)
        storage = LandingStorage.createForTesting(userDefaults: userDefaults)
    }
    
    override func tearDown() {
        userDefaults.removePersistentDomain(forName: #file)
        userDefaults = nil
        storage = nil
        super.tearDown()
    }
    
    func testHasShownLandingPage_WhenNotShown_ReturnsFalse() {
        // Given
        let identifier = "test_landing"
        
        // When
        let hasShown = storage.hasShownLandingPage(identifier: identifier)
        
        // Then
        XCTAssertFalse(hasShown)
    }
    
    func testMarkLandingPageAsShown_WhenCalled_SetsFlag() {
        // Given
        let identifier = "test_landing"
        
        // When
        storage.markLandingPageAsShown(identifier: identifier)
        
        // Then
        XCTAssertTrue(storage.hasShownLandingPage(identifier: identifier))
    }
    
    func testResetLandingPage_WhenCalled_RemovesFlag() {
        // Given
        let identifier = "test_landing"
        storage.markLandingPageAsShown(identifier: identifier)
        
        // When
        storage.resetLandingPage(identifier: identifier)
        
        // Then
        XCTAssertFalse(storage.hasShownLandingPage(identifier: identifier))
    }
    
    func testResetAllLandingPages_WhenCalled_RemovesAllFlags() {
        // Given
        let identifiers = ["landing1", "landing2", "landing3"]
        identifiers.forEach { storage.markLandingPageAsShown(identifier: $0) }
        
        // When
        storage.resetAllLandingPages()
        
        // Then
        identifiers.forEach {
            XCTAssertFalse(storage.hasShownLandingPage(identifier: $0))
        }
    }
} 