/// The message about the successful performing of an action in a shopping list.
enum MediatorPrompt {
    // MARK: - Internal interface

    /// Displayed when an item was added to the list.
    case itemAdded(String)
    /// Displayed when an item was removed by name from the list.
    case itemRemovedByName(String)
    /// Displayed when an item was removed by number from the list.
    case itemRemovedByNumber(Int)
    /// Displayed when showing shopping list.
    case showList(String)

    var message: String {
        switch self {
        case let .itemAdded(item):
            return "The item \"\(item)\" was successfully added to the list."
        case let .itemRemovedByName(item):
            return "The item \"\(item)\" was successfully removed from the list."
        case let .itemRemovedByNumber(number):
            return "Item \"\(number)\" was successfully removed from the list."
        case let .showList(listContent):
            return "\nSHOPPING LIST:\n\(listContent)"
        }
    }
}
