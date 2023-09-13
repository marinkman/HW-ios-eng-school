import XCTest

final class StopTests: XCTestCase {
    override func setUp() {
        runLoop = RunLoop()
    }

    func testStopStopsTheRunLoopWhenGivenActiveRunLoop() {
        // Given
        runLoop.start()

        // When
        runLoop.stop()

        // Then
        XCTAssertTrue(runLoop.shouldStop)
    }

    func testStopLeavesTheRunLoopInactiveWhenGivenInactiveRunLoop() {
        // Given // When
        runLoop.stop()

        // Then
        XCTAssertTrue(runLoop.shouldStop)
    }

    private var runLoop = RunLoop()
}
