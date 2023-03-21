/// Represents a shopping list.
class InMemoryShoppingList: ShoppingList {
    // MARK: - Internal interface

    private(set) var shoppingList = [String]()

    /**
     A dummy method to mock behavior of conforming to the `ShoppingList` protocol.
     The `shoppingList` won't be modified upon the method's call.

     - Parameter item: Item to remove from a `shoppingList`.
     - Returns: Hardcored `true` value. The returned value does not depend on input data.
     */
    func add(_: String) -> Bool {
        true
    }

    /**
     A dummy method to mock behavior of conforming to the `ShoppingList` protocol.
     The `shoppingList` won't be modified upon the method's call.

     - Parameter item: Item to remove from a `shoppingList`.
     - Returns: Hardcored `true` value. The returned value does not depend on input data.
     */
    func remove(_: String) -> Bool {
        true
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
