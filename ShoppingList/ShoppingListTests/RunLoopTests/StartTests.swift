import XCTest

final class StartTests: XCTestCase {
    override func setUp() {
        runLoop = RunLoop()
    }

    func testStartStartsTheRunLoopWhenGivenInactiveRunLoop() {
        runLoop.start()

        XCTAssertFalse(runLoop.shouldStop)
    }

    func testStartLeavesTheRunLoopActiveWhenGivenActiveRunLoop() {
        runLoop.start()

        runLoop.start()

        XCTAssertFalse(runLoop.shouldStop)
    }

    private var runLoop = RunLoop()
}
