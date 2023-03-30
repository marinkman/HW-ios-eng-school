import Foundation

/// Represents the errors that occur in the `CommandValidator`.
enum ValidatorError: Error {
    /// Indicates that an unexpected command was entered.
    case unexpectedCommand(String)
    /// Indicates that the command wasn't entered.
    case missingCommand
}

extension ValidatorError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .unexpectedCommand(command):
            return "An unexpected command \"\(command)\"was entered."
        case .missingCommand:
            return "Command wasn't entered"
        }
    }
}
