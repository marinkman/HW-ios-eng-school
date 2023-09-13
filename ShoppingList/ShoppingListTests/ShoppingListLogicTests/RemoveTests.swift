import XCTest

class RemoveTests: XCTestCase {
    override func setUp() {
        groceryList = InMemoryShoppingList()
    }

    func testRemovePresentsInTheAPI() {
        groceryList.remove("oil")
    }

    func testRemoveRemovesOnlyOneItem() {
        // Given
        let item1 = "pork"
        let item2 = "beef"
        groceryList.add(item1)
        groceryList.add(item2)
        let numberOfItemsBeforeRemoving = groceryList.shoppingList.count

        // When
        groceryList.remove(item1)
        let numberOfItemsAfterRemoving = groceryList.shoppingList.count

        // Then
        XCTAssertEqual(numberOfItemsBeforeRemoving - 1, numberOfItemsAfterRemoving)
    }

    func testRemoveRemovesTheSpecifiedItemFromTheList() {
        // Given
        let item1 = "sugar"
        let item2 = "salt"
        groceryList.add(item1)
        groceryList.add(item2)

        // When
        groceryList.remove(item1)

        // Then
        let contains = groceryList.shoppingList.contains(item1)

        XCTAssertFalse(contains)
    }

    func testRemoveReturnsTrueIfTheItemWasRemovedFromTheList() {
        // Given
        let item = "milk"
        groceryList.add(item)

        // When
        let wasRemoved = groceryList.remove(item)

        // Then
        XCTAssertTrue(wasRemoved)
    }

    func testRemoveReturnsFalseIfTheItemWasNotRemovedFromTheList() {
        // Given
        let item1 = "tomatoes"
        let item2 = "cucumbers"
        groceryList.add(item1)

        // When
        let wasRemoved = groceryList.remove(item2)

        // Then
        XCTAssertFalse(wasRemoved)
    }

    func testRemoveReturnsFalseIfTheListIsEmpty() {
        // Given // When
        let wasRemoved = groceryList.remove("pepper")

        // Then
        XCTAssertFalse(wasRemoved)
    }

    func testRemoveDoesNotRemoveAnyItemFromTheListIfTheItemToRemoveIsNotPresentInTheList() {
        // Given
        let item1 = "apples"
        let item2 = "pears"
        let item3 = "bananas"
        groceryList.add(item1)
        groceryList.add(item2)
        let numberOfItemsBeforeRemoving = groceryList.shoppingList.count

        // When
        groceryList.remove(item3)
        let numberOfItemsAfterRemoving = groceryList.shoppingList.count

        // Then
        XCTAssertEqual(numberOfItemsBeforeRemoving, numberOfItemsAfterRemoving)
    }

    private var groceryList = InMemoryShoppingList()
}
