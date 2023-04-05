import Foundation

/// Error that can occur when performing an action on the shopping list.
enum MediatorError: Error {
    /// Indicates that the item wasn't added because the list is full.
    /// Associated with a string value that represents the item name entered by the user.
    case listIsFull(String)
    /// Indicates that the item wasn't removed because an invalid item name was entered.
    /// Associated with a string value that represents the item name entered by the user.
    case invalidItemNameToRemove(String)
    /// Indicates that the item wasn't removed because an invalid item number was entered.
    /// Associated with a string value that represents the item number entered by the user.
    case invalidItemNumberToRemove(Int)
    /// Indicates that the list is empty.
    case emptyList
}

extension MediatorError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .listIsFull(item):
            return "The item \"\(item)\" wasn't added because the list is already full."
        case let .invalidItemNameToRemove(item):
            return "The item \"\(item)\" wasn't removed because an item named \"\(item)\" doesn't exist in the list."
        case let .invalidItemNumberToRemove(number):
            return "Item \"\(number)\" wasn't removed because an item number \"\(number)\" doesn't exist in the list."
        case .emptyList:
            return "Shopping List is empty."
        }
    }
}
