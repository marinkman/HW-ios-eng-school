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

/**
 Provides implementation of the `Stack` with additional operations:
 - `minimum`, which allows effective finding the minimum among the stored elements.
 */
class StackStatistics<Element>: Stack<Element> where Element: Comparable {
    // MARK: Internal interface
    /**
     Returns the minimum among the elements stored in the stack.
     - Returns: the minimum among the elements stored in the stack, or `nil` if the stack is empty.
     */
    var minimum: Element? {
        minimumElements.peek()
    }

    override func push(_ element: Element) {
        super.push(element)
        updateMinimumIfNeeded(with: element)
    }

    override func pop() -> Element? {
        updateMinimumByRemovingElement()
        return super.pop()
    }

    // MARK: Private interface
    private var minimumElements = Stack<Element>()

    private func updateMinimumIfNeeded(with newElement: Element) {
        let previousMinimum = minimumElements.peek() ?? newElement
        let newMinimum = min(previousMinimum, newElement)
        minimumElements.push(newMinimum)
    }

    private func updateMinimumByRemovingElement() {
        minimumElements.pop()
    }
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

    func testCountDoesNotReturnZeroWhenTheStackIsNotEmpty() {
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
        let amountOfElementsBeforeAdding = stack.count

        stack.push(2)

        let amountOfElementsAfterAdding = stack.count

        XCTAssertEqual(amountOfElementsBeforeAdding, amountOfElementsAfterAdding - 1)
    }

    func testPushAddsMaxElementToTheStack() {
        let amountOfElementsBeforeAdding = stack.count

        stack.push(Int.max)

        let amountOfElementsAfterAdding = stack.count

        XCTAssertEqual(amountOfElementsBeforeAdding, amountOfElementsAfterAdding - 1)
    }

    func testPushAddsMinElementToTheStack() {
        let amountOfElementsBeforeAdding = stack.count

        stack.push(Int.min)

        let amountOfElementsAfterAdding = stack.count

        XCTAssertEqual(amountOfElementsBeforeAdding, amountOfElementsAfterAdding - 1)
    }

    func testPushAddsElementToTheTopOfTheStack() {
        stack.push(5)
        stack.push(1)
        stack.push(3)

        XCTAssertEqual(stack.peek(), 3)
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
        let poppedElement = stack.pop()

        XCTAssertNil(poppedElement)
    }

    func testPopDoesNotReturnNilWhenTheStackIsNotEmpty() {
        stack.push(1)

        let topElement = stack.pop()

        XCTAssertNotNil(topElement)
    }

    func testPopRemovesOneElementFromTheStack() {
        stack.push(1)

        let amountOfElementsInStackBeforePop = stack.count

        stack.pop()

        let amountOfElementsInStackAfterPop = stack.count

        XCTAssertEqual(amountOfElementsInStackAfterPop, amountOfElementsInStackBeforePop - 1)
    }

    func testPopRemovesTheLastElementFromTheStackWhenTheStackContainsOneElement() {
        stack.push(1)
        stack.pop()

        XCTAssertTrue(stack.isEmpty)
    }

    func testPopReturnsTheElementThatWasAddedToTheStack() {
        let element = 1

        stack.push(element)

        let topElement = stack.pop()

        XCTAssertEqual(topElement, element)
    }

    func testPopReturnsTheElementThatWasAddedMostRecently() {
        let firstElement = 1
        let secondElement = 2

        stack.push(firstElement)
        stack.push(secondElement)

        let topElement = stack.pop()

        XCTAssertEqual(topElement, secondElement)
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
        let topElement = stack.peek()

        XCTAssertNil(topElement)
    }

    func testPeekDoesNotReturnNilWhenTheStackIsNotEmpty() {
        stack.push(1)

        let topElement = stack.peek()

        XCTAssertNotNil(topElement)
    }

    func testPeekReturnsTheElementButDoesNotRemoveIt() {
        stack.push(1)

        let amountOfElementsBeforePeek = stack.count

        stack.peek()

        let amountOfElementsAfterPeek = stack.count

        XCTAssertEqual(amountOfElementsBeforePeek, amountOfElementsAfterPeek)
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
