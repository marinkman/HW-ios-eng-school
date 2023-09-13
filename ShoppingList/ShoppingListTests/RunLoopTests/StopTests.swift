import XCTest

final class StopTests: XCTestCase {
    override func setUp() {
        runLoop = RunLoop()
    }

    func testStopStopsTheRunLoopWhenGivenActiveRunLoop() {
        runLoop.start()

        runLoop.stop()

        XCTAssertTrue(runLoop.shouldStop)
    }

    func testStopLeavesTheRunLoopInactiveWhenGivenInactiveRunLoop() {
        runLoop.stop()

        XCTAssertTrue(runLoop.shouldStop)
    }

    private var runLoop = RunLoop()
}
