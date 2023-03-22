/// Represents a shopping list.
class InMemoryShoppingList: ShoppingList {
    // MARK: - Internal interface

    private(set) var shoppingList = [String]()

    /**
     Adds an item at the end of the list. If the item is already in the list, moves it to the end of the list.

     - Parameter item: Item to add to the `shoppingList`.
     - Complexity: `O(N)`, where `N` is the length of the `shoppingList`.
     - Returns: `true` if the `item` was already present or was added to the `shoppingList`
     or `item` is empty, otherwise `false`.
     */
    @discardableResult func add(_ item: String) -> Bool {
        guard !isFull else { return false }
        guard !item.isEmpty else { return true }

        shoppingList.removeAll { $0 == item }
        shoppingList.append(item)

        return true
    }

    /**
     Removes the specified item from the list.

     - Parameter item: Item to remove from a `shoppingList`.
     - Complexity: `O(N)`, where `N` is the length of the `shoppingList`.
     - Returns: `true` if the `item` was removed from the `shoppingList`, otherwise `false`.
     */
    @discardableResult func remove(_ item: String) -> Bool {
        guard shoppingList.contains(item) else { return false }

        shoppingList.removeAll { $0 == item }

        return true
    }

    /**
     Removes the item at the specified position from the list.

     - Parameter position: The position of the item to remove. `position` must be a natural number.
     - Complexity: `O(N)`, where `N` is the length of the `shoppingList`.
     - Returns: `true` if the item at `position` was removed from a `shoppingList`, otherwise `false`.
     */
    @discardableResult func remove(at position: Int) -> Bool {
        guard (0..<shoppingList.count).contains(position) else { return false }

        shoppingList.remove(at: position - 1)

        return true
    }

    // MARK: - Private interface

    private let maxListCapacity = 10
    private var isFull: Bool {
        shoppingList.count >= maxListCapacity
    }
}
