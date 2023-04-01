import Foundation

/// Represents the errors that occur in the `ItemValidator`.
enum ItemValidatorError: Error {
    /// Indicates that the item number isn't listed.
    case notListed(String)
    /// Indicates that the item number wasn't entered.
    case missingItemNumber
    /// Indicates that the item name wasn't entered.
    case missingItemName
    /// Indicates that the value isn't an integer.
    case notAnInteger(String)
}

extension ItemValidatorError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .notListed(number):
            return "Item number \"\(number)\" isn't on the list."
        case .missingItemNumber:
            return "Item number wasn't entered."
        case .missingItemName:
            return "Item name wasn't entered."
        case let .notAnInteger(value):
            return "The value \"\(value)\" isn't an integer. Item number must be an integer."
        }
    }
}
