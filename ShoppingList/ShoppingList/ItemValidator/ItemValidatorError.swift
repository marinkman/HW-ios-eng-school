import Foundation

/// Error that can occur during the validation user input.
enum ItemValidatorError: Error {
    /// Indicates that the item number is out of the valid range.
    /// Associated with a string value that represents the item number entered by the user.
    case outOfRange(String)
    /// Indicates that the item number wasn't entered.
    case missingItemNumber
    /// Indicates that the item name wasn't entered.
    case missingItemName
    /// Indicates that the value isn't an integer.
    /// Associated with a string value that represents the value entered by the user.
    case notAnInteger(String)
}

extension ItemValidatorError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .outOfRange(number):
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
