import XCTest

class ValidateItemNameTests: XCTestCase {
    override func setUp() {
        itemValidator = ItemValidator()
    }

    func testValidateItemNameReturnsSuccesIfANonEmptyStringIsPassed() {
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
        let item = "oil"

        let validationResult = itemValidator.validateItemName(item)

        switch validationResult {
        case let .success(itemName):
            XCTAssertEqual(item, itemName)
        default:
            XCTAssertTrue(false)
        }
    }

    private var itemValidator = ItemValidator()
}
