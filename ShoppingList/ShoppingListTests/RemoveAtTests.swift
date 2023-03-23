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

        groceryList.remove(at: 0)
        let numberOfItemsAfterRemoving = groceryList.shoppingList.count

        XCTAssertEqual(numberOfItemsBeforeRemoving - 1, numberOfItemsAfterRemoving)
    }

    func testRemoveAtRemovesTheSpecifiedItemFromTheList() {
        let itemWithIndexZero = "sugar"
        let itemWithIndexOne = "salt"
        groceryList.add(itemWithIndexZero)
        groceryList.add(itemWithIndexOne)

        groceryList.remove(at: 0)

        let contains = groceryList.shoppingList.contains(itemWithIndexZero)

        XCTAssertFalse(contains)
    }

    func testRemoveAtReturnsTrueIfTheItemWasRemovedFromTheList() {
        let item = "milk"
        groceryList.add(item)

        let wasRemoved = groceryList.remove(at: 0)

        XCTAssertTrue(wasRemoved)
    }

    func testRemoveAtReturnsFalseIfTheItemWasNotRemovedFromTheList() {
        let item = "tomatoes"
        groceryList.add(item)

        let wasRemoved = groceryList.remove(at: 1)

        XCTAssertFalse(wasRemoved)
    }

    func testRemoveAtReturnsFalseIfTheListIsEmpty() {
        let wasRemoved = groceryList.remove(at: 0)

        XCTAssertFalse(wasRemoved)
    }

    func testRemoveAtDoesNotRemoveAnyItemFromTheListIfThePositionToRemoveIsNotPresentInTheList() {
        let itemWithIndexZero = "apples"
        let itemWithIndexOne = "pears"
        groceryList.add(itemWithIndexZero)
        groceryList.add(itemWithIndexOne)
        let numberOfItemsBeforeRemoving = groceryList.shoppingList.count

        groceryList.remove(at: 2)
        let numberOfItemsAfterRemoving = groceryList.shoppingList.count

        XCTAssertEqual(numberOfItemsBeforeRemoving, numberOfItemsAfterRemoving)
    }

    private var groceryList = InMemoryShoppingList()
}
