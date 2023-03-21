import XCTest

class AddTests: XCTestCase {
    override func setUp() {
        groceryList = InMemoryShoppingList()
    }

    func testAddPresentsInTheAPI() {
        let _ = groceryList.add("oil")
    }

    func testAddAddsOnlyOneItem() {
        let item = "pork"
        let numberOfItemsBeforeAdding = groceryList.shoppingList.count

        let _ = groceryList.add(item)
        let numberOfItemsAfterAdding = groceryList.shoppingList.count

        XCTAssertEqual(numberOfItemsAfterAdding, numberOfItemsBeforeAdding + 1)
    }

    func testAddAddsItemsToTheEndOfTheList() {
        let item1 = "milk"
        let item2 = "fish"

        let _ = groceryList.add(item1)
        let _ = groceryList.add(item2)

        XCTAssertEqual(item2, groceryList.shoppingList.last)
    }

    func testAddReturnsTrueIfTheItemWasAddedToTheList() {
        let item = "garlic"

        let wasAdded = groceryList.add(item)

        XCTAssertTrue(wasAdded)
    }

    func testAddReturnsTrueIfTheItemWasAlreadyPresentInTheList() {
        let item = "bread"

        let _ = groceryList.add(item)
        let wasAdded = groceryList.add(item)

        XCTAssertTrue(wasAdded)
    }

    func testAddReturnsFalseIfTheItemWasNotAddedInTheList() {
        let maxListCapacity = 10
        for itemNumber in 1...maxListCapacity {
            let _ = groceryList.add("item\(itemNumber)")
        }

        let item11 = "beef"
        let wasAdded = groceryList.add(item11)

        XCTAssertFalse(wasAdded)
    }

    func testAddMovesTheItemToTheEndOfTheListIfTheItemWasAlreadyPresentInTheList() {
        let item1 = "chicken"
        let item2 = "butter"

        let _ = groceryList.add(item1)
        let _ = groceryList.add(item2)
        let _ = groceryList.add(item1)

        XCTAssertEqual(item1, groceryList.shoppingList.last)
    }

    func testAddDoesNotDuplicateAnAlreadyPresentItem() {
        let item = "cookie"
        let _ = groceryList.add(item)
        let numberOfItemsBeforeAdding = groceryList.shoppingList.count

        let _ = groceryList.add(item)
        let numberOfItemsAfterAdding = groceryList.shoppingList.count

        XCTAssertEqual(numberOfItemsBeforeAdding, numberOfItemsAfterAdding)
    }

    private var groceryList = InMemoryShoppingList()
}
