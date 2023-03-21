/// Represents a shopping list.
class InMemoryShoppingList: ShoppingList {
    // MARK: - Internal interface

    private(set) var shoppingList = [String]()

    /**
     Adds an item at the end of the list. If the item is already in the list, moves it to the end of the list.

     - Parameter item: Item to add to the `shoppingList`.
     - Complexity: `O(N)`, where `N` is the length of the `shoppingList`.
     - Returns: `true` if the `item` was already present or was added to the `shoppingList`, otherwise `false`.
     */
    func add(_ item: String) -> Bool {
        guard !isFull else { return false }

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
    func remove(_ item: String) -> Bool {
        guard shoppingList.contains(item) else { return false }

        shoppingList.removeAll { $0 == item }

        return true
    }

    /**
     A dummy method to mock behavior of conforming to the `ShoppingList` protocol.
     The `shoppingList` won't be modified upon the method's call.

     - Parameter index: The position of the element in the `shoppingList` to remove.
     - Returns: Hardcored `true` value. The returned value does not depend on input data.
     */
    func remove(at _: Int) -> Bool {
        true
    }

    // MARK: - Private interface

    private let maxListCapacity = 10
    private var isFull: Bool {
        shoppingList.count >= maxListCapacity
    }
}
