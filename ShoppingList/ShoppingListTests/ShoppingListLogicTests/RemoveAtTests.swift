import XCTest

class RemoveAtTests: XCTestCase {
    override func setUp() {
        groceryList = InMemoryShoppingList()
    }

    func testRemoveAtPresentsInTheAPI() {
        groceryList.remove(at: 1)
    }

    func testRemoveAtRemovesOnlyOneItem() {
        // Given
        let item1 = "pork"
        let item2 = "beef"
        groceryList.add(item1)
        groceryList.add(item2)
        let numberOfItemsBeforeRemoving = groceryList.shoppingList.count

        // When
        groceryList.remove(at: 0)
        let numberOfItemsAfterRemoving = groceryList.shoppingList.count

        // Then
        XCTAssertEqual(numberOfItemsBeforeRemoving - 1, numberOfItemsAfterRemoving)
    }

    func testRemoveAtRemovesTheSpecifiedItemFromTheList() {
        // Given
        let itemWithIndexZero = "sugar"
        let itemWithIndexOne = "salt"
        groceryList.add(itemWithIndexZero)
        groceryList.add(itemWithIndexOne)

        // When
        groceryList.remove(at: 0)

        // Then
        let contains = groceryList.shoppingList.contains(itemWithIndexZero)

        XCTAssertFalse(contains)
    }

    func testRemoveAtReturnsTrueIfTheItemWasRemovedFromTheList() {
        // Given
        let item = "milk"
        groceryList.add(item)

        // When
        let wasRemoved = groceryList.remove(at: 0)

        // Then
        XCTAssertTrue(wasRemoved)
    }

    func testRemoveAtReturnsFalseIfTheItemWasNotRemovedFromTheList() {
        // Given
        let item = "tomatoes"
        groceryList.add(item)

        // When
        let wasRemoved = groceryList.remove(at: 1)

        // Then
        XCTAssertFalse(wasRemoved)
    }

    func testRemoveAtReturnsFalseIfTheListIsEmpty() {
        // Given // When
        let wasRemoved = groceryList.remove(at: 0)

        // Then
        XCTAssertFalse(wasRemoved)
    }

    func testRemoveAtDoesNotRemoveAnyItemFromTheListIfThePositionToRemoveIsNotPresentInTheList() {
        // Given
        let itemWithIndexZero = "apples"
        let itemWithIndexOne = "pears"
        groceryList.add(itemWithIndexZero)
        groceryList.add(itemWithIndexOne)
        let numberOfItemsBeforeRemoving = groceryList.shoppingList.count

        // When
        groceryList.remove(at: 2)
        let numberOfItemsAfterRemoving = groceryList.shoppingList.count

        // Then
        XCTAssertEqual(numberOfItemsBeforeRemoving, numberOfItemsAfterRemoving)
    }

    private var groceryList = InMemoryShoppingList()
}
