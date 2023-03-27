import XCTest

class ValidateTests: XCTestCase {
    func testValidateReturnsSuccessIfAStringWithValidCommandIsPassed() {
        let stringWithValidCommand = Command.show.rawValue

        let validationResult = CommandValidator.validate(stringWithValidCommand)

        switch validationResult {
        case .success:
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateReturnsFailureIfAStringWithInvalidCommandIsPassed() {
        let stringWithInvalidCommand = "c"

        let validationResult = CommandValidator.validate(stringWithInvalidCommand)

        switch validationResult {
        case .failure:
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateReturnsTheAppropriateCommandIfAStringWithValidCommandIsPassed() {
        let validCommand = Command.show
        let stringWithValidCommand = validCommand.rawValue

        let validationResult = CommandValidator.validate(stringWithValidCommand)
        switch validationResult {
        case .success(validCommand):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateReturnsTheApropriateErrorIfAStringWithInvalidCommandIsPassed() {
        let stringWithInvalidCommand = "c"

        let validationResult = CommandValidator.validate(stringWithInvalidCommand)

        switch validationResult {
        case .failure(ValidatorError.unexpectedCommand(stringWithInvalidCommand)):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }
}
