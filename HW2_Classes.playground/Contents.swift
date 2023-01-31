import XCTest

/**
 Provides implementation of a linear data structure that serves as a collection of elements, with two main operations:
 - `push`, which adds an element to the collection.
 - `pop`, which removes the most recently added element that was not yet removed.
 The `push` and `pop` operations occur only at one end of the stack, referred to as the `top` of the stack.
 The order in which an element added to or removed from a stack is described as last in, first out, referred to by the acronym `LIFO`. That measn the element at the top of the stack is the one that was most recently added.
 */
class Stack<Element> {
    // MARK: Internal interface
    /// A boolean value indicating whether the stack is empty.
    var isEmpty: Bool {
        elements.isEmpty
    }

    /// The number of elements in the stack.
    var count: Int {
        elements.count
    }

    /**
     Adds an element to the top of the stack.
     Pushing new item to the stack is an `O(1)` operation when averaged over many calls to the `push(\_:)` method.
     When a stack has additional capacity and is not sharing its internal storage with another instance, pushing an element works in `O(1)`.
     When a stack needs to reallocate storage before pushing or its storage is shared with another copy,
     pushing is `O(n)`, where `n` is number of items stored in the stack at the moment.
     - Parameter element: The element to be added into the stack.
     - Complexity: `O(1)` on average, `O(n)` in the worst case.
     */
    func push(_ element: Element) {
        elements.append(element)
    }

    /**
     Removes and returns the element from the top of the stack.
     - Returns: The element from the top of the stack, or `nil` if the stack was empty.
     */
    func pop() -> Element? {
        elements.popLast()
    }

    /**
     Returns the element from the top of the stack, without removing it.
     - Returns: The element from the top of the stack, or `nil` if the stack was empty.
     */
    func peek() -> Element? {
        elements.last
    }

    // MARK: Private interface
    private var elements = [Element]()
}

class StackIsEmptyPropertyTests: XCTestCase {
    override func setUp() {
        stack = Stack<Int>()
    }
    
    func testIsEmptyPropertyPresentsInTheAPI() {
        stack.isEmpty
    }

    func testIsEmptyReturnsTrueWhenTheStackIsEmpty() {
        XCTAssertTrue(stack.isEmpty)
    }
    
    func testIsEmptyReturnsFalseWhenTheStackIsNotEmpty() {
        stack.push(1)
        
        XCTAssertFalse(stack.isEmpty)
    }

    private var stack = Stack<Int>()
}

StackIsEmptyPropertyTests.defaultTestSuite.run()

class StackCountPropertyTests: XCTestCase {
    override func setUp() {
        stack = Stack<Int>()
    }
    
    func testCountPropertyPresentsInTheAPI() {
        stack.count
    }

    func testCountReturnsZeroWhenTheStackIsEmpty() {
        XCTAssertEqual(stack.count, 0)
    }
    
    func testCountReturnsNotZeroWhenTheStackIsNotEmpty() {
        stack.push(1)
        
        XCTAssertNotEqual(stack.count, 0)
    }

    private var stack = Stack<Int>()
}

StackCountPropertyTests.defaultTestSuite.run()

class StackPushMethodTests: XCTestCase {
    override func setUp() {
        stack = Stack<Int>()
    }
    
    func testPushMethodPresentsInTheAPI() {
        stack.push(1)
    }

    func testPushAddsElementToTheStack() {
        let numberOfElementsBeforeAdding = stack.count
        
        stack.push(2)
        
        let numberOfElementsAfterAdding = stack.count
        
        XCTAssertEqual(numberOfElementsBeforeAdding, numberOfElementsAfterAdding - 1)
    }
    
    func testPushAddsMaxElementToTheStack() {
        let numberOfElementsBeforeAdding = stack.count
        
        stack.push(Int.max)
        
        let numberOfElementsAfterAdding = stack.count
        
        XCTAssertEqual(numberOfElementsBeforeAdding, numberOfElementsAfterAdding - 1)
    }
    
    func testPushAddsMinElementToTheStack() {
        let numberOfElementsBeforeAdding = stack.count
        
        stack.push(Int.min)
        
        let numberOfElementsAfterAdding = stack.count
        
        XCTAssertEqual(numberOfElementsBeforeAdding, numberOfElementsAfterAdding - 1)
    }

    func testPushAddsElementToTheTopOfTheStack() {
        stack.push(5)
        stack.push(1)
        stack.push(3)
        
        XCTAssert(stack.peek() == 3)
    }

    private var stack = Stack<Int>()
}

StackPushMethodTests.defaultTestSuite.run()

class StackPopMethodTests: XCTestCase {
    override func setUp() {
        stack = Stack<Int>()
    }

    func testPopMethodPresentsInTheAPI() {
        stack.pop()
    }

    func testPopReturnsNilWhenTheStackIsEmpty() {
        let actualValue = stack.pop()

        XCTAssertNil(actualValue)
    }

    func testPopDoesNotReturnsNilWhenTheStackIsNotEmpty() {
        stack.push(1)

        let actualValue = stack.pop()

        XCTAssertNotNil(actualValue)
    }

    func testPopRemovesOneElementFromTheStack() {
        stack.push(1)

        let elementsInStackBeforePop = stack.count

        stack.pop()

        let elementsInStackAfterPop = stack.count
        XCTAssertEqual(elementsInStackAfterPop, elementsInStackBeforePop - 1)
    }

    func testPopRemovesLastElementFromTheStackWhenTheStackContainsOneElement() {
        stack.push(1)
        stack.pop()

        XCTAssertTrue(stack.isEmpty)
    }

    func testPopReturnsTheElementThatWasAddedToTheStack() {
        let firstElement = 1

        stack.push(firstElement)

        let actualValue = stack.pop()

        XCTAssertEqual(actualValue, firstElement)
    }

    func testPopReturnsElementThatWasAddedMostRecently() {
        let firstElement = 1
        let secondElement = 2

        stack.push(firstElement)
        stack.push(secondElement)

        let actualValue = stack.pop()

        XCTAssertEqual(actualValue, secondElement)
    }

    func testPopCallsReturnElementsAccordingLIFOStructure() {
        let firstElement = 1
        let secondElement = 2
        let thirdElement = 3

        stack.push(firstElement)
        stack.push(secondElement)
        stack.push(thirdElement)

        let firstActualValue = stack.pop()
        let secondActualValue = stack.pop()
        let thirdActualValue = stack.pop()

        XCTAssertEqual(firstActualValue, thirdElement)
        XCTAssertEqual(secondActualValue, secondElement)
        XCTAssertEqual(thirdActualValue, firstElement)
    }

    private var stack = Stack<Int>()
}

StackPopMethodTests.defaultTestSuite.run()

class StackPeekMethodTests: XCTestCase {
    override func setUp() {
        stack = Stack<Int>()
    }
    
    func testPeekMethodPresentsInTheAPI() {
        stack.peek()
    }

    func testPeekReturnsNilWhenTheStackIsEmpty() {
        let actualValue = stack.peek()
        
        XCTAssertNil(actualValue)
    }
    
    func testPeekDoesReturnsNotNilWhenTheStackIsNotEmpty() {
        stack.push(1)
        
        let actualValue = stack.peek()
        
        XCTAssertNotNil(actualValue)
    }
    
    func testPeekReturnsElementButNotToRemoveIt() {
        stack.push(1)
        
        let numberOfElementsBeforePeek = stack.count
        
        stack.peek()
        
        let numberOfElementsAfterPeek = stack.count
        
        XCTAssertEqual(numberOfElementsBeforePeek, numberOfElementsAfterPeek)
    }
    
    func testPeekReturnsTheElementFromTheTop() {
        let firstElement = 5
        let secondElement = 1
        let thirdElement = 2

        stack.push(firstElement)
        stack.push(secondElement)
        stack.push(thirdElement)
        
        let firstActualValue = stack.peek()
        
        stack.pop()
        
        let secondActualValue = stack.peek()
        
        stack.pop()
        
        let thirdActualValue = stack.peek()

        XCTAssertEqual(firstActualValue, thirdElement)
        XCTAssertEqual(secondActualValue, secondElement)
        XCTAssertEqual(thirdActualValue, firstElement)
    }

    private var stack = Stack<Int>()
}

StackPeekMethodTests.defaultTestSuite.run()
