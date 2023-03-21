import XCTest

class AddTests: XCTestCase {
    override func setUp() {
        groceryList = InMemoryShoppingList()
    }

    func testAddPresentsInTheAPI() {
        let _ = groceryList.add("oil")
    }

    private var groceryList = InMemoryShoppingList()
}
