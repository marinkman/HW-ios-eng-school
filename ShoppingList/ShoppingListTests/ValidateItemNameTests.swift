import XCTest

class ValidateItemNameTests: XCTestCase {
    override func setUp() {
        itemValidator = ItemValidator()
    }

    func testValidateItemNameReturnsSuccessIfANonEmptyStringIsPassed() {
        let nonEmptyString = "oil"

        let validationResult = itemValidator.validateItemName(nonEmptyString)

        switch validationResult {
        case .success:
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateItemNameReturnsFailureIfAnEmptyStringIsPassed() {
        let emptyString = ""

        let validationResult = itemValidator.validateItemName(emptyString)

        switch validationResult {
        case .failure:
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateItemNameReturnsTheAppropriateItemNameIfANonEmptyStringIsPassed() {
        let passedItemName = "oil"

        let validationResult = itemValidator.validateItemName(passedItemName)

        switch validationResult {
        case let .success(resultingItemName):
            XCTAssertEqual(passedItemName, resultingItemName)
        default:
            XCTAssertTrue(false)
        }
    }

    private var itemValidator = ItemValidator()
}
