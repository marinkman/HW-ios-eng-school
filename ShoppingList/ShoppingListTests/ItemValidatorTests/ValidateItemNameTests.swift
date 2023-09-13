import XCTest

class ValidateItemNameTests: XCTestCase {
    override func setUp() {
        itemValidator = ItemValidator()
    }

    func testValidateItemNameReturnsSuccessIfANonEmptyStringIsPassed() {
        // Given
        let nonEmptyString = "oil"

        // When
        let validationResult = itemValidator.validateItemName(nonEmptyString)

        // Then
        switch validationResult {
        case .success:
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateItemNameReturnsFailureIfAnEmptyStringIsPassed() {
        // Given
        let emptyString = ""

        // When
        let validationResult = itemValidator.validateItemName(emptyString)

        // Then
        switch validationResult {
        case .failure:
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateItemNameReturnsTheAppropriateItemNameIfANonEmptyStringIsPassed() {
        // Given
        let passedItemName = "oil"

        // When
        let validationResult = itemValidator.validateItemName(passedItemName)

        // Then
        switch validationResult {
        case let .success(resultingItemName):
            XCTAssertEqual(passedItemName, resultingItemName)
        default:
            XCTAssertTrue(false)
        }
    }

    private var itemValidator = ItemValidator()
}
