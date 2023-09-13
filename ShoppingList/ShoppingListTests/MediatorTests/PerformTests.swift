import XCTest

class PerformTests: XCTestCase {
    override func setUp() {
        mediator = Mediator(shoppingList: InMemoryShoppingList())
    }

    func testPerformReturnsSuccessWhenTheActionWasPerformed() {
        // Given
        let action = ListAction.add(itemName: "cookie")

        // When
        let performanceResult = mediator.perform(action)

        // Then
        switch performanceResult {
        case .success:
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testPerformReturnsFailureWhenTheActionWasNotPerformed() {
        // Given
        let action = ListAction.show

        // When
        let performanceResult = mediator.perform(action)

        // Then
        switch performanceResult {
        case .failure:
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testPerformReturnsTheAppropriateErrorWhenTheActionWasNotPerformed() {
        // Given
        let action = ListAction.show

        // When
        let performanceResult = mediator.perform(action)

        // Then
        switch performanceResult {
        case .failure(MediatorError.emptyList):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    private var mediator = Mediator(shoppingList: InMemoryShoppingList())
}
