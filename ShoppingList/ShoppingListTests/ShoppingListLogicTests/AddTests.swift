import XCTest

class AddTests: XCTestCase {
    override func setUp() {
        groceryList = InMemoryShoppingList()
    }

    func testAddPresentsInTheAPI() {
        groceryList.add("oil")
    }

    func testAddAddsOnlyOneItem() {
        // Given
        let item = "pork"
        let numberOfItemsBeforeAdding = groceryList.shoppingList.count

        // When
        groceryList.add(item)
        let numberOfItemsAfterAdding = groceryList.shoppingList.count

        // Then
        XCTAssertEqual(numberOfItemsAfterAdding, numberOfItemsBeforeAdding + 1)
    }

    func testAddAddsItemsToTheEndOfTheList() {
        // Given
        let item1 = "milk"
        let item2 = "fish"

        // When
        groceryList.add(item1)
        groceryList.add(item2)

        // Then
        XCTAssertEqual(item2, groceryList.shoppingList.last)
    }

    func testAddReturnsTrueIfTheItemWasAddedToTheList() {
        // Given
        let item = "garlic"

        // When
        let wasAdded = groceryList.add(item)

        // Then
        XCTAssertTrue(wasAdded)
    }

    func testAddReturnsTrueIfTheItemWasAlreadyPresentInTheList() {
        // Given
        let item = "bread"

        // When
        groceryList.add(item)
        let wasAdded = groceryList.add(item)

        // Then
        XCTAssertTrue(wasAdded)
    }

    func testAddReturnsFalseIfTheItemWasNotAddedInTheList() {
        // Given
        let maxListCapacity = 10
        for itemNumber in 1...maxListCapacity {
            groceryList.add("item\(itemNumber)")
        }
        let item11 = "beef"

        // When
        let wasAdded = groceryList.add(item11)

        // Then
        XCTAssertFalse(wasAdded)
    }

    func testAddMovesTheItemToTheEndOfTheListIfTheItemWasAlreadyPresentInTheList() {
        // Given
        let item1 = "chicken"
        let item2 = "butter"

        // When
        groceryList.add(item1)
        groceryList.add(item2)
        groceryList.add(item1)

        // Then
        XCTAssertEqual(item1, groceryList.shoppingList.last)
    }

    func testAddDoesNotDuplicateAnAlreadyPresentItem() {
        // Given
        let item = "cookie"
        groceryList.add(item)
        let numberOfItemsBeforeAdding = groceryList.shoppingList.count

        // When
        groceryList.add(item)
        let numberOfItemsAfterAdding = groceryList.shoppingList.count

        // Then
        XCTAssertEqual(numberOfItemsBeforeAdding, numberOfItemsAfterAdding)
    }

    func testAddReturnsTrueIfTheItemIsEmpty() {
        // Given
        let item = ""

        // When
        let wasAdded = groceryList.add(item)

        // Then
        XCTAssertTrue(wasAdded)
    }

    func testAddDoesNotAddAnEmptyItem() {
        // Given
        let numberOfItemsBeforeAdding = groceryList.shoppingList.count
        let item = ""

        // When
        groceryList.add(item)
        let numberOfItemsAfterAdding = groceryList.shoppingList.count

        // Then
        XCTAssertEqual(numberOfItemsBeforeAdding, numberOfItemsAfterAdding)
    }

    func testAddDoesNotChangeTheOrderOfOtherItemsWhenAddingAnItemThatWasAlreadyPresentInTheList() {
        // Given
        let item1 = "water"
        let item2 = "juice"
        let item3 = "soda"

        groceryList.add(item1)
        groceryList.add(item2)
        groceryList.add(item3)

        let listBeforeAdding = groceryList.shoppingList

        // When
        groceryList.add(item2)
        let listAfterAdding = groceryList.shoppingList

        let listBeforeAddingWithoutItemToAdd = listBeforeAdding.filter { $0 != item2 }
        let listAfterAddingWithoutItemToAdd = listAfterAdding.filter { $0 != item2 }

        // Then
        XCTAssertEqual(listBeforeAddingWithoutItemToAdd, listAfterAddingWithoutItemToAdd)
    }

    private var groceryList = InMemoryShoppingList()
}
