import XCTest

class ValidateItemNumberTests: XCTestCase {
    override func setUp() {
        itemValidator = ItemValidator()
    }

    func testValidateItemNumberReturnsSuccessIfAStringWithValidItemNumberIsPassed() {
        // Given
        let stringWithValidItemNumber = "3"

        // When
        let validationResult = itemValidator.validateItemNumber(stringWithValidItemNumber)

        // Then
        switch validationResult {
        case .success:
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateItemNumberReturnsFailureIfAStringWithInvalidItemNumberIsPassed() {
        // Given
        let stringWithInvalidItemNumber = "a"

        // When
        let validationResult = itemValidator.validateItemNumber(stringWithInvalidItemNumber)

        // Then
        switch validationResult {
        case .failure:
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateItemNumberReturnsTheAppropriateNumberIfAStringWithValidNumberIsPassed() {
        // Given
        let stringWithValidItemNumber = "3"
        let expectedNumber = 3

        // When
        let validationResult = itemValidator.validateItemNumber(stringWithValidItemNumber)

        // Then
        switch validationResult {
        case let .success(actualNumber):
            XCTAssertEqual(expectedNumber, actualNumber)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateItemNumberReturnsTheAppropriateErrorIfAnOutOfRangeItemNumberIsPassed() {
        // Given
        let stringWithInvalidItemNumber = "0"

        // When
        let validationResult = itemValidator.validateItemNumber(stringWithInvalidItemNumber)

        // Then
        switch validationResult {
        case .failure(ItemValidatorError.outOfRange(stringWithInvalidItemNumber)):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateItemNumberReturnsTheAppropriateErrorIfAnEmptyStringIsPassed() {
        // Given
        let emptyString = ""

        // When
        let validationResult = itemValidator.validateItemNumber(emptyString)

        // Then
        switch validationResult {
        case .failure(ItemValidatorError.missingItemNumber):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateItemNumberReturnsTheAppropriateErrorIfThePassedStringCouldNotBeConvertedToAnInteger() {
        // Given
        let stringWithANonInteger = "a"

        // When
        let validationResult = itemValidator.validateItemNumber(stringWithANonInteger)

        // Then
        switch validationResult {
        case .failure(ItemValidatorError.notAnInteger(stringWithANonInteger)):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    private var itemValidator = ItemValidator()
}
