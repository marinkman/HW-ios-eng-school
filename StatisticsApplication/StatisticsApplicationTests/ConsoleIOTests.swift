import XCTest

final class ConsoleIOTests: XCTestCase {
    func testWriteMessagePresentsInTheAPI() {
        ConsoleIO.writeMessage("")
    }

    func testReadInputPresentsInTheAPI() {
        try? ConsoleIO.readInput()
    }
}
