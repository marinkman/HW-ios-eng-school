/// A mediator between the user interface and the `ShoppingList` object.
class Mediator {
    // MARK: - Internal interface

    /**
     Initializes a new instance of the `Mediator` class.
     - Parameter shoppingList: The `ShoppingList` object to manage.
     */
    init(shoppingList: ShoppingList) {
        self.shoppingList = shoppingList
    }

    /**
     Performs an action on the shopping list.
     - Parameter action: The action to perfofm.
     - Returns: `Result` representing the success or failure of the execution.
     In case of success the `Result` containts a `String` value with a success message,
     otherwise it contains `Error`.
     */
    func perform(_ action: ListAction) -> Result<String, Error> {
        switch action {
        case let .add(itemName):
            return add(itemName)
        case let .remove(itemName):
            return remove(itemName)
        case let .removeAt(itemNumber):
            return removeAt(itemNumber)
        case .show:
            return showList()
        }
    }

    // MARK: - Private interface

    private let shoppingList: ShoppingList

    private func add(_ item: String) -> Result<String, Error> {
        let wasAdded = shoppingList.add(item)

        guard wasAdded else {
            return .failure(MediatorError.listIsFull(item))
        }

        return .success(MediatorPrompt.itemAdded(item).message)
    }

    private func remove(_ item: String) -> Result<String, Error> {
        let wasRemoved = shoppingList.remove(item)

        guard wasRemoved else {
            return .failure(MediatorError.unexpectedItemNameToRemove(item))
        }

        return .success(MediatorPrompt.itemRemovedByName(item).message)
    }

    private func removeAt(_ number: Int) -> Result<String, Error> {
        let index = number - 1
        let wasRemoved = shoppingList.remove(at: index)

        guard wasRemoved else {
            return .failure(MediatorError.unexpectedItemNumberToRemove(number))
        }

        return .success(MediatorPrompt.itemRemovedByNumber(number).message)
    }

    private func showList() -> Result<String, Error> {
        guard !shoppingList.shoppingList.isEmpty else {
            return .failure(MediatorError.emptyList)
        }

        var listContent = String()
        for (index, item) in shoppingList.shoppingList.enumerated() {
            listContent += "   \(index + 1). \(item)\n"
        }
        return .success(MediatorPrompt.showList(listContent).message)
    }
}
