/// Represents a shopping list.
class Storage {
    private(set) var shoppingList = [String]()
    private let maxListCapacity = 10
    private var isFull: Bool {
        shoppingList.count >= maxListCapacity
    }
}
