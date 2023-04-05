import XCTest

class PerformTests: XCTestCase {
    override func setUp() {
        mediator = Mediator(shoppingList: InMemoryShoppingList())
    }

    func testPerformReturnsSuccessWhenTheActionWasPerformed() {
        let action = ListAction.add(itemName: "cookie")

        let performanceResult = mediator.perform(action)

        switch performanceResult {
        case .success:
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testPerformReturnsFailureWhenTheActionWasNotPerformed() {
        let action = ListAction.show

        let performanceResult = mediator.perform(action)

        switch performanceResult {
        case .failure:
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testPerformReturnsTheAppropriateErrorWhenTheActionWasNotPerformed() {
        let action = ListAction.show

        let performanceResult = mediator.perform(action)

        switch performanceResult {
        case .failure(MediatorError.emptyList):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    private var mediator = Mediator(shoppingList: InMemoryShoppingList())
}
