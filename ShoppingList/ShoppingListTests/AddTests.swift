import XCTest

class AddTests: XCTestCase {
    override func setUp() {
        groceryList = InMemoryShoppingList()
    }

    func testAddPresentsInTheAPI() {
        groceryList.add("oil")
    }

    func testAddAddsOnlyOneItem() {
        let item = "pork"
        let numberOfItemsBeforeAdding = groceryList.shoppingList.count

        groceryList.add(item)
        let numberOfItemsAfterAdding = groceryList.shoppingList.count

        XCTAssertEqual(numberOfItemsAfterAdding, numberOfItemsBeforeAdding + 1)
    }

    func testAddAddsItemsToTheEndOfTheList() {
        let item1 = "milk"
        let item2 = "fish"

        groceryList.add(item1)
        groceryList.add(item2)

        XCTAssertEqual(item2, groceryList.shoppingList.last)
    }

    func testAddReturnsTrueIfTheItemWasAddedToTheList() {
        let item = "garlic"

        let wasAdded = groceryList.add(item)

        XCTAssertTrue(wasAdded)
    }

    func testAddReturnsTrueIfTheItemWasAlreadyPresentInTheList() {
        let item = "bread"

        groceryList.add(item)
        let wasAdded = groceryList.add(item)

        XCTAssertTrue(wasAdded)
    }

    func testAddReturnsFalseIfTheItemWasNotAddedInTheList() {
        let maxListCapacity = 10
        for itemNumber in 1...maxListCapacity {
            groceryList.add("item\(itemNumber)")
        }

        let item11 = "beef"
        let wasAdded = groceryList.add(item11)

        XCTAssertFalse(wasAdded)
    }

    func testAddMovesTheItemToTheEndOfTheListIfTheItemWasAlreadyPresentInTheList() {
        let item1 = "chicken"
        let item2 = "butter"

        groceryList.add(item1)
        groceryList.add(item2)
        groceryList.add(item1)

        XCTAssertEqual(item1, groceryList.shoppingList.last)
    }

    func testAddDoesNotDuplicateAnAlreadyPresentItem() {
        let item = "cookie"
        groceryList.add(item)
        let numberOfItemsBeforeAdding = groceryList.shoppingList.count

        groceryList.add(item)
        let numberOfItemsAfterAdding = groceryList.shoppingList.count

        XCTAssertEqual(numberOfItemsBeforeAdding, numberOfItemsAfterAdding)
    }

    func testAddReturnsTrueIfTheItemIsEmpty() {
        let item = ""

        let wasAdded = groceryList.add(item)

        XCTAssertTrue(wasAdded)
    }

    private var groceryList = InMemoryShoppingList()
}
