import Foundation

/// Represents an error that occurs in the `CommandValidator`.
enum ValidatorError: Error {
    /// Indicates that an unexpected command was entered.
    case unexpectedCommand(String)
}

extension ValidatorError: LocalizedError {
    public var errorMessage: String? {
        switch self {
        case let .unexpectedCommand(command):
            return "An unexpected command \"\(command)\"was entered."
        }
    }
}
