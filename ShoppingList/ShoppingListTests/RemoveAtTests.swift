import XCTest

class RemoveAtTests: XCTestCase {
    override func setUp() {
        groceryList = InMemoryShoppingList()
    }

    func testRemoveAtPresentsInTheAPI() {
        groceryList.remove(at: 1)
    }

    func testRemoveAtRemovesOnlyOneItem() {
        let item1 = "pork"
        let item2 = "beef"
        groceryList.add(item1)
        groceryList.add(item2)
        let numberOfItemsBeforeRemoving = groceryList.shoppingList.count

        groceryList.remove(at: 1)
        let numberOfItemsAfterRemoving = groceryList.shoppingList.count

        XCTAssertEqual(numberOfItemsBeforeRemoving, numberOfItemsAfterRemoving - 1)
    }

    func testRemoveAtRemovesTheSpecifiedItemFromTheList() {
        let firstItem = "sugar"
        let secondItem = "salt"
        groceryList.add(firstItem)
        groceryList.add(secondItem)

        groceryList.remove(at: 1)

        XCTAssertFalse(groceryList.shoppingList.contains(firstItem))
    }

    func testRemoveAtReturnsTrueIfTheItemWasRemovedFromTheList() {
        let item = "milk"
        groceryList.add(item)

        let wasRemoved = groceryList.remove(at: 1)

        XCTAssertTrue(wasRemoved)
    }

    func testRemoveAtReturnsFalseIfTheItemWasNotRemovedFromTheList() {
        let item = "tomatoes"
        groceryList.add(item)

        let wasRemoved = groceryList.remove(at: 2)

        XCTAssertFalse(wasRemoved)
    }

    func testRemoveAtReturnsFalseIfTheListIsEmpty() {
        let wasRemoved = groceryList.remove(at: 1)

        XCTAssertFalse(wasRemoved)
    }

    func testRemoveAtReturnsFalseIfNullIsPassed() {
        let item = "potatoes"
        groceryList.add(item)

        let wasRemoved = groceryList.remove(at: 0)

        XCTAssertFalse(wasRemoved)
    }

    func testRemoveAtDoesNotRemoveAnyItemFromTheListIfThePositionToRemoveIsNotPresentInTheList() {
        let item1 = "apples"
        let item2 = "pears"
        groceryList.add(item1)
        groceryList.add(item2)
        let numberOfItemsBeforeRemoving = groceryList.shoppingList.count

        groceryList.remove(at: 3)
        let numberOfItemsAfterRemoving = groceryList.shoppingList.count

        XCTAssertEqual(numberOfItemsBeforeRemoving, numberOfItemsAfterRemoving)
    }

    private var groceryList = InMemoryShoppingList()
}
