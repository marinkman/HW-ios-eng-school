/// The action that can be performed on the list.
enum ListAction {
    /// Shows the list of items.
    case show
    /// Adds a new item to the list.
    /// - Parameter itemName: The name of the item to add.
    case add(itemName: String)
    /// Removes an item from the list by name.
    /// - Parameter itemName: The name of the item to remove.
    case remove(itemName: String)
    /// Removes an item from the list by number.
    /// - Parameter itemNumber: The number of the item to remove.
    case removeAt(itemNumber: Int)
}
