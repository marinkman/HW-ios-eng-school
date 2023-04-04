import Foundation

/// Error that can occur during the validation user input.
enum CommandValidatorError: Error {
    /// Indicates that an unexpected command was entered.
    /// Associated with a string value that represents the command entered by the user.
    case unexpectedCommand(String)
    /// Indicates that the command wasn't entered.
    case missingCommand
}

extension CommandValidatorError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .unexpectedCommand(command):
            return "An unexpected command \"\(command)\" was entered."
        case .missingCommand:
            return "Command wasn't entered."
        }
    }
}
