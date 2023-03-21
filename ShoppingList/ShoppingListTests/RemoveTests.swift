import XCTest

class RemoveTests: XCTestCase {
    override func setUp() {
        groceryList = InMemoryShoppingList()
    }

    func testRemovePresentsInTheAPI() {
        let _ = groceryList.remove("oil")
    }

    func testRemoveRemovesOnlyOneItem() {
        let item1 = "pork"
        let item2 = "beef"
        let _ = groceryList.add(item1)
        let _ = groceryList.add(item2)
        let numberOfItemsBeforeRemoving = groceryList.shoppingList.count

        let _ = groceryList.remove(item1)
        let numberOfItemsAfterRemoving = groceryList.shoppingList.count

        XCTAssertEqual(numberOfItemsBeforeRemoving, numberOfItemsAfterRemoving - 1)
    }

    func testRemoveRemovesTheSpecifiedItemFromTheList() {
        let item1 = "sugar"
        let item2 = "salt"
        let _ = groceryList.add(item1)
        let _ = groceryList.add(item2)

        let _ = groceryList.remove(item1)

        XCTAssertFalse(groceryList.shoppingList.contains(item1))
    }

    func testRemoveReturnsTrueIfTheItemWasRemovedFromTheList() {
        let item = "milk"
        let _ = groceryList.add(item)

        let wasRemoved = groceryList.remove(item)

        XCTAssertTrue(wasRemoved)
    }

    func testRemoveReturnsFalseIfTheItemWasNotRemovedFromTheList() {
        let item1 = "tomatoes"
        let item2 = "cucumbers"
        let _ = groceryList.add(item1)

        let wasRemoved = groceryList.remove(item2)

        XCTAssertFalse(wasRemoved)
    }

    func testRemoveReturnsFalseIfTheListIsEmpty() {
        let wasRemoved = groceryList.remove("pepper")

        XCTAssertFalse(wasRemoved)
    }

    func testRemoveDoesNotRemoveAnyItemFromTheListIfTheItemToRemoveIsNotPresentInTheList() {
        let item1 = "apples"
        let item2 = "pears"
        let item3 = "bananas"
        let _ = groceryList.add(item1)
        let _ = groceryList.add(item2)
        let numberOfItemsBeforeRemoving = groceryList.shoppingList.count

        let _ = groceryList.remove(item3)
        let numberOfItemsAfterRemoving = groceryList.shoppingList.count

        XCTAssertEqual(numberOfItemsBeforeRemoving, numberOfItemsAfterRemoving)
    }

    private var groceryList = InMemoryShoppingList()
}
