import XCTest
@testable import SwiftSDL2TestProject

final class SwiftSDL2TestProjectTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftSDL2TestProject().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
