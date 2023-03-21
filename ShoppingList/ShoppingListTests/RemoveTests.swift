import XCTest

class RemoveTests: XCTestCase {
    override func setUp() {
        groceryList = InMemoryShoppingList()
    }

    func testRemovePresentsInTheAPI() {
        let _ = groceryList.remove("oil")
    }

    private var groceryList = InMemoryShoppingList()
}
