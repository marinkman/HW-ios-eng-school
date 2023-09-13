import XCTest

class ValidateTests: XCTestCase {
    override func setUp() {
        commandValidator = CommandValidator()
    }

    func testValidateReturnsSuccessIfAStringWithValidCommandIsPassed() {
        // Given
        let stringWithValidCommand = Command.show.rawValue

        // When
        let validationResult = commandValidator.validate(stringWithValidCommand)

        // Then
        switch validationResult {
        case .success:
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateReturnsFailureIfAStringWithInvalidCommandIsPassed() {
        // Given
        let stringWithInvalidCommand = "c"

        // When
        let validationResult = commandValidator.validate(stringWithInvalidCommand)

        // Then
        switch validationResult {
        case .failure:
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateReturnsTheAppropriateCommandIfAStringWithValidCommandIsPassed() {
        // Given
        let validCommand = Command.show
        let stringWithValidCommand = validCommand.rawValue

        // When
        let validationResult = commandValidator.validate(stringWithValidCommand)

        // Then
        switch validationResult {
        case .success(validCommand):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateReturnsTheAppropriateErrorIfAStringWithInvalidCommandIsPassed() {
        // Given
        let stringWithInvalidCommand = "c"

        // When
        let validationResult = commandValidator.validate(stringWithInvalidCommand)

        // Then
        switch validationResult {
        case .failure(CommandValidatorError.unexpectedCommand(stringWithInvalidCommand)):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateReturnsTheAppropriateErrorIfAnEmptyStringIsPassed() {
        // Given
        let emptyString = ""

        // When
        let validationResult = commandValidator.validate(emptyString)

        // Then
        switch validationResult {
        case .failure(CommandValidatorError.missingCommand):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    private var commandValidator = CommandValidator()
}
