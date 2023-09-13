import XCTest

final class StartTests: XCTestCase {
    override func setUp() {
        runLoop = RunLoop()
    }

    func testStartStartsTheRunLoopWhenGivenInactiveRunLoop() {
        // Given // When
        runLoop.start()

        // Then
        XCTAssertFalse(runLoop.shouldStop)
    }

    func testStartLeavesTheRunLoopActiveWhenGivenActiveRunLoop() {
        // Given
        runLoop.start()

        // When
        runLoop.start()

        // Then
        XCTAssertFalse(runLoop.shouldStop)
    }

    private var runLoop = RunLoop()
}
