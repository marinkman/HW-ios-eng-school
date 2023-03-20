/// Represents a shopping list.
class Storage {
    // MARK: - Internal interface

    private(set) var shoppingList = [String]()

    // MARK: - Private interface

    private let maxListCapacity = 10
    private var isFull: Bool {
        shoppingList.count >= maxListCapacity
    }
}
