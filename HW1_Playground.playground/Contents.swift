import XCTest

 /**
  Compares two values and find the smallest.
  
  - Parameters:
     - value1: Comparised value.
     - value2: Comparised value.
  
  - Requires:
     `value1` and `value2` must  conform to the `Comparable` protocol.
  
  - Complexity: `O(1)`.
  
  - Returns: Smallest value (`value1` or `value2`). If the values are equal returns `value1`.
  */

 func minOfTwoValues<T: Comparable>(_ value1: T, _ value2: T) -> T {
     value1 <= value2 ? value1 : value2
 }

 class TestMinOfTwoValues: XCTestCase {
     func testFindMinReturnsMinValueWhenGivenTwoPositiveNumbers() {
         XCTAssert(minOfTwoValues(8, 9) == 8)
         XCTAssert(minOfTwoValues(9, 8) == 8)
         XCTAssert(Float(minOfTwoValues(3.1, 3.2)) == 3.1)
         XCTAssert(Float(minOfTwoValues(3.2, 3.1)) == 3.1)
         XCTAssert(Double(minOfTwoValues(3.012345679, 3.012345678)) == 3.012345678)
         XCTAssert(Double(minOfTwoValues(3.012345678, 3.012345679)) == 3.012345678)
     }

     func testFindMinReturnsMinValueWhenGivenOnePositiveAndOneNegativeNumbers() {
         XCTAssert(minOfTwoValues(1, -3) == -3)
         XCTAssert(minOfTwoValues(-3, 1) == -3)
         XCTAssert(Float(minOfTwoValues(1.567, -3.1234)) == -3.1234)
         XCTAssert(Float(minOfTwoValues(-3.1234, 1.567)) == -3.1234)
         XCTAssert(Double(minOfTwoValues(-3.012345679, 3.012345678)) == -3.012345679)
         XCTAssert(Double(minOfTwoValues(3.012345678, -3.012345679)) == -3.012345679)
     }

     func testFindMinReturnsMinValueWhenGivenTwoEqualNumbers() {
         XCTAssert(minOfTwoValues(0, 0) == 0)
         XCTAssert(minOfTwoValues(1, 1) == 1)
         XCTAssert(Float(minOfTwoValues(5.98765, 5.98765)) == 5.98765)
         XCTAssert(Double(minOfTwoValues(3.0123456789, 3.0123456789)) == 3.0123456789)
     }

     func testFindMinReturnsMinValueWhenGivenOnePositiveAndOneGreatestNumber() {
         XCTAssert(minOfTwoValues(5, Int.max) == 5)
         XCTAssert(Float(minOfTwoValues(Float.greatestFiniteMagnitude, 5.98765)) == 5.98765)
         XCTAssert(Double(minOfTwoValues(3.0123456789, Double.greatestFiniteMagnitude)) == 3.0123456789)
     }

     func testFindMinReturnsMinValueWhenGivenOneNegativeAndOneSmallestNumber() {
         XCTAssert(minOfTwoValues(-1, Int.min) == Int.min)
     }

     func testFindMinReturnsMinValueWhenGivenOneGreatestAndOneSmallestNumber() {
         XCTAssert(minOfTwoValues(Int.max, Int.min) == Int.min)
     }

     func testFindMinReturnsMinValueWhenGivenTwoCharacters() {
         XCTAssert(minOfTwoValues("G", "P") == "G")
         XCTAssert(minOfTwoValues("P", "G") == "G")
     }

     func testFindMinReturnsMinValueWhenGivenTwoStrings() {
         XCTAssert(minOfTwoValues("Alex", "Mary") == "Alex")
         XCTAssert(minOfTwoValues("Mary", "Alex") == "Alex")
     }
 }

 TestMinOfTwoValues.defaultTestSuite.run()

 /**
  Compares two values and find the greatest.
  
  - Parameters:
     - value1: Comparised value.
     - value2: Comparised value.
  
  - Requires:
     `value1` and `value2` must conform to the `Comparable` protocol.
  
  - Complexity: `O(1)`.
  
  - Returns: Greatest value (`value1` or `value2`). If the values are equal returns `value1`.
  */

 func maxOfTwoValues<T: Comparable>(_ value1: T, _ value2: T) -> T {
     value1 >= value2 ? value1 : value2
 }

 class TestMaxOfTwoValues: XCTestCase {
     func testFindMaxReturnsMaxValueWhenGivenTwoPositiveNumbers() {
         XCTAssert(maxOfTwoValues(8, 9) == 9)
         XCTAssert(maxOfTwoValues(9, 8) == 9)
         XCTAssert(Float(maxOfTwoValues(3.1, 3.2)) == 3.2)
         XCTAssert(Float(maxOfTwoValues(3.2, 3.1)) == 3.2)
         XCTAssert(Double(maxOfTwoValues(3.012345679, 3.012345678)) == 3.012345679)
         XCTAssert(Double(maxOfTwoValues(3.012345678, 3.012345679)) == 3.012345679)
     }

     func testFindMaxReturnsMaxValueWhenGivenOnePositiveAndOneNegativeNumbers() {
         XCTAssert(maxOfTwoValues(1, -3) == 1)
         XCTAssert(maxOfTwoValues(-3, 1) == 1)
         XCTAssert(Float(maxOfTwoValues(1.567, -3.1234)) == 1.567)
         XCTAssert(Float(maxOfTwoValues(-3.1234, 1.567)) == 1.567)
         XCTAssert(Double(maxOfTwoValues(-3.012345679, 3.012345678)) == 3.012345678)
         XCTAssert(Double(maxOfTwoValues(3.012345678, -3.012345679)) == 3.012345678)
     }

     func testFindMaxReturnsMaxValueWhenGivenTwoEqualNumbers() {
         XCTAssert(maxOfTwoValues(0, 0) == 0)
         XCTAssert(maxOfTwoValues(1, 1) == 1)
         XCTAssert(Float(maxOfTwoValues(5.98765, 5.98765)) == 5.98765)
         XCTAssert(Double(maxOfTwoValues(3.0123456789, 3.0123456789)) == 3.0123456789)
     }

     func testFindMaxReturnsMaxValueWhenGivenOnePositiveAndOneGreatestNumber() {
         XCTAssert(maxOfTwoValues(5, Int.max) == Int.max)
         XCTAssert(Float(maxOfTwoValues(Float.greatestFiniteMagnitude, 5.98765)) == Float.greatestFiniteMagnitude)
         XCTAssert(Double(maxOfTwoValues(3.012345678, Double.greatestFiniteMagnitude)) == Double.greatestFiniteMagnitude)
     }

     func testFindMaxReturnsMaxValueWhenGivenOneNegativeAndOneSmallestNumber() {
         XCTAssert(maxOfTwoValues(-1, Int.min) == -1)
     }

     func testFindMaxReturnsMaxValueWhenGivenOneGreatestAndOneSmallestNumber() {
         XCTAssert(maxOfTwoValues(Int.max, Int.min) == Int.max)
     }

     func testFindMaxReturnsMaxValueWhenGivenTwoCharacters() {
         XCTAssert(maxOfTwoValues("G", "P") == "P")
         XCTAssert(maxOfTwoValues("P", "G") == "P")
     }

     func testFindMaxReturnsMaxValueWhenGivenTwoStrings() {
         XCTAssert(maxOfTwoValues("Alex", "Mary") == "Mary")
         XCTAssert(maxOfTwoValues("Mary", "Alex") == "Mary")
     }
 }

 TestMaxOfTwoValues.defaultTestSuite.run()

 func minOfThreeValues<T: Comparable>(_ value1: T, _ value2: T, _ value3: T) -> T {
     minOfTwoValues(minOfTwoValues(value1, value2), value3)
 }

 assert(minOfThreeValues(-6, 1, 0) == -6)
 assert(minOfThreeValues(1, 0, -6) == -6)
 assert(minOfThreeValues(0, 0, 0) == 0)
 assert(minOfThreeValues(1, 1, 1) == 1)
 assert(minOfThreeValues(0, -1, 0) == -1)
 assert(minOfThreeValues(0, Int.min, -1) == Int.min)
 assert(minOfThreeValues(-5, 10, Int.max) == -5)
 assert(minOfThreeValues(Int.max, 0, Int.min) == Int.min)

 func maxOfThreeValues<T: Comparable>(_ value1: T, _ value2: T, _ value3: T) -> T {
     maxOfTwoValues(maxOfTwoValues(value1, value2), value3)
 }

 assert(maxOfThreeValues(-6, 1, 0) == 1)
 assert(maxOfThreeValues(1, 0, -6) == 1)
 assert(maxOfThreeValues(0, 0, 0) == 0)
 assert(maxOfThreeValues(1, 1, 1) == 1)
 assert(maxOfThreeValues(0, -1, 0) == 0)
 assert(maxOfThreeValues(0, Int.min, -1) == 0)
 assert(maxOfThreeValues(-5, 10, Int.max) == Int.max)
 assert(maxOfThreeValues(Int.max, 0, Int.min) == Int.max)

 func minValue<T: Comparable>(_ array: [T]) -> T? {
     guard var minValue = array.first else { return nil }

     for value in array {
         minValue = minOfTwoValues(value, minValue)
     }

     return minValue
 }

assert(minValue([1, 4, -1, 48, -32]) == -32)
assert(minValue([1, 4, -1, -48, 32]) == -48)
assert(minValue([0, 0, 0, 0]) == 0)
assert(minValue([1, 1, 1]) == 1)
assert(minValue([1, 0, -1, -1, 0]) == -1)
assert(minValue([0, Int.min, -183]) == Int.min)
assert(minValue([-99, 0, -1, Int.max, Int.min]) == Int.min)
assert(minValue([183, Int.max, -183]) == -183)

 func maxValue<T: Comparable>(_ array: [T]) -> T? {
     guard var maxValue = array.first else { return nil }

     for value in array {
         maxValue = maxOfTwoValues(value, maxValue)
     }

     return maxValue
 }

assert(maxValue([1, 4, -1, 48, -32]) == 48)
assert(maxValue([1, 4, -1, -48, 32]) == 32)
assert(maxValue([0, 0, 0, 0]) == 0)
assert(maxValue([1, 1, 1]) == 1)
assert(maxValue([1, 0, -1, -1, 0]) == 1)
assert(maxValue([0, Int.min, -183]) == 0)
assert(maxValue([-99, Int.max, Int.min]) == Int.max)
assert(maxValue([183, 0, -1, Int.max, -183]) == Int.max)
