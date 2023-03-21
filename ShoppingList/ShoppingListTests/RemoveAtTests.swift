import XCTest

class RemoveAtTests: XCTestCase {
    override func setUp() {
        groceryList = InMemoryShoppingList()
    }

    func testRemoveAtPresentsInTheAPI() {
        let _ = groceryList.remove(at: 1)
    }

    private var groceryList = InMemoryShoppingList()
}
