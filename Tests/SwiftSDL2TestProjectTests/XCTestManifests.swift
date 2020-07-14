import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SwiftSDL2TestProjectTests.allTests),
    ]
}
#endif
