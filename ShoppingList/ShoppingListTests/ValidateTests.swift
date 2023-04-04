import XCTest

class ValidateTests: XCTestCase {
    override func setUp() {
        commandValidator = CommandValidator()
    }

    func testValidateReturnsSuccessIfAStringWithValidCommandIsPassed() {
        let stringWithValidCommand = Command.show.rawValue

        let validationResult = commandValidator.validate(stringWithValidCommand)

        switch validationResult {
        case .success:
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateReturnsFailureIfAStringWithInvalidCommandIsPassed() {
        let stringWithInvalidCommand = "c"

        let validationResult = commandValidator.validate(stringWithInvalidCommand)

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

        let validationResult = commandValidator.validate(stringWithValidCommand)
        switch validationResult {
        case .success(validCommand):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateReturnsTheApropriateErrorIfAStringWithInvalidCommandIsPassed() {
        let stringWithInvalidCommand = "c"

        let validationResult = commandValidator.validate(stringWithInvalidCommand)

        switch validationResult {
        case .failure(.unexpectedCommand(stringWithInvalidCommand)):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    func testValidateReturnsTheApropriateErrorIfAnEmptyStringIsPassed() {
        let emptyString = ""

        let validationResult = commandValidator.validate(emptyString)

        switch validationResult {
        case .failure(.missingCommand):
            XCTAssertTrue(true)
        default:
            XCTAssertTrue(false)
        }
    }

    private var commandValidator = CommandValidator()
}
