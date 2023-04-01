import Foundation

/// Represents the errors that occur in the `ItemValidator`.
enum ItemValidatorError: Error {
    /// Indicates that an unexpected item number was entered.
    case unexpectedItemNumber(String)
    /// Indicates that the item number wasn't entered.
    case missingItemNumber
    /// Indicates that the item name wasn't entered.
    case missingItemName
}

extension ItemValidatorError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .unexpectedItemNumber(number):
            return "An unexpected item number \"\(number)\"was entered."
        case .missingItemNumber:
            return "Item number wasn't entered"
        case .missingItemName:
            return "Item name wasn't entered"
        }
    }
}
