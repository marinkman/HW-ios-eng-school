import XCTest

class ValidateItemNumberTests: XCTestCase {
    override func setUp() {
        itemValidator = ItemValidator()
    }

    func testValidateItemNumberReturnsSuccessIfAStringWithValidItemNumberIsPassed() {
        let stringWithValidItemNumber = "3"

        let validationResult = itemValidator.validateItemNumber(stringWithValidItemNumber)

        switch validationResult {
        case .success:
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateItemNumberReturnsFailureIfAStringWithInvalidItemNumberIsPassed() {
        let stringWithInvalidItemNumber = "a"

        let validationResult = itemValidator.validateItemNumber(stringWithInvalidItemNumber)

        switch validationResult {
        case .failure:
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateItemNumberReturnsTheAppropriateNumberIfAStringWithValidNumberIsPassed() {
        let stringWithValidItemNumber = "3"
        let expectedNumber = 3

        let validationResult = itemValidator.validateItemNumber(stringWithValidItemNumber)

        switch validationResult {
        case let .success(actualNumber):
            XCTAssertEqual(expectedNumber, actualNumber)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateItemNumberReturnsTheAppropriateErrorIfAnOutOfRangeItemNumberIsPassed() {
        let stringWithInvalidItemNumber = "0"

        let validationResult = itemValidator.validateItemNumber(stringWithInvalidItemNumber)

        switch validationResult {
        case .failure(.outOfRange(stringWithInvalidItemNumber)):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateItemNumberReturnsTheApropriateErrorIfAnEmptyStringIsPassed() {
        let emptyString = ""

        let validationResult = itemValidator.validateItemNumber(emptyString)

        switch validationResult {
        case .failure(.missingItemNumber):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateItemNumberReturnsTheAppropriateErrorIfThePassedStringCouldNotBeConvertedToAnInteger() {
        let stringWithANonInteger = "a"

        let validationResult = itemValidator.validateItemNumber(stringWithANonInteger)

        switch validationResult {
        case .failure(.notAnInteger(stringWithANonInteger)):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    private var itemValidator = ItemValidator()
}
