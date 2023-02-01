import XCTest

 /**
  Compares two values and find the smallest.
  
  - Parameters:
     - value1: First value to compare.
     - value2: Second value to compare.
  
  - Requires:
     `value1` and `value2` must  conform to the `Comparable` protocol.
  
  - Returns: The smallest among input values. If the input values are equal returns the first one.
  */
 func minOfTwoValues<T: Comparable>(_ value1: T, _ value2: T) -> T {
     value1 <= value2 ? value1 : value2
 }

 class TestMinOfTwoValues: XCTestCase {
     func testMinOfTwoValuesReturnsMinValueWhenGivenTwoPositiveNumbers() {
         XCTAssertEqual(minOfTwoValues(8, 9), 8)
         XCTAssertEqual(minOfTwoValues(9, 8), 8)
         XCTAssertEqual(Float(minOfTwoValues(3.1, 3.2)), 3.1)
         XCTAssertEqual(Float(minOfTwoValues(3.2, 3.1)), 3.1)
         XCTAssertEqual(Double(minOfTwoValues(3.012345679, 3.012345678)), 3.012345678)
         XCTAssertEqual(Double(minOfTwoValues(3.012345678, 3.012345679)), 3.012345678)
     }

     func testMinOfTwoValuesReturnsMinValueWhenGivenOnePositiveAndOneNegativeNumbers() {
         XCTAssertEqual(minOfTwoValues(1, -3), -3)
         XCTAssertEqual(minOfTwoValues(-3, 1), -3)
         XCTAssertEqual(Float(minOfTwoValues(1.567, -3.1234)), -3.1234)
         XCTAssertEqual(Float(minOfTwoValues(-3.1234, 1.567)), -3.1234)
         XCTAssertEqual(Double(minOfTwoValues(-3.012345679, 3.012345678)), -3.012345679)
         XCTAssertEqual(Double(minOfTwoValues(3.012345678, -3.012345679)), -3.012345679)
     }

     func testMinOfTwoValuesReturnsMinValueWhenGivenTwoEqualNumbers() {
         XCTAssertEqual(minOfTwoValues(0, 0), 0)
         XCTAssertEqual(minOfTwoValues(1, 1), 1)
         XCTAssertEqual(Float(minOfTwoValues(5.98765, 5.98765)), 5.98765)
         XCTAssertEqual(Double(minOfTwoValues(3.0123456789, 3.0123456789)), 3.0123456789)
     }

     func testMinOfTwoValuesReturnsMinValueWhenGivenOnePositiveAndOneGreatestNumber() {
         XCTAssertEqual(minOfTwoValues(5, Int.max), 5)
         XCTAssertEqual(Float(minOfTwoValues(Float.greatestFiniteMagnitude, 5.98765)), 5.98765)
         XCTAssertEqual(Double(minOfTwoValues(3.0123456789, Double.greatestFiniteMagnitude)), 3.0123456789)
     }

     func testMinOfTwoValuesReturnsMinValueWhenGivenOneNegativeAndOneSmallestNumber() {
         XCTAssertEqual(minOfTwoValues(-1, Int.min), Int.min)
     }

     func testMinOfTwoValuesReturnsMinValueWhenGivenOneGreatestAndOneSmallestNumber() {
         XCTAssertEqual(minOfTwoValues(Int.max, Int.min), Int.min)
     }

     func testMinOfTwoValuesReturnsMinValueWhenGivenTwoCharacters() {
         XCTAssertEqual(Character(minOfTwoValues("G", "P")), "G")
         XCTAssertEqual(Character(minOfTwoValues("P", "G")), "G")
     }

     func testMinOfTwoValuesReturnsMinValueWhenGivenTwoStrings() {
         XCTAssertEqual(minOfTwoValues("Alex", "Mary"), "Alex")
         XCTAssertEqual(minOfTwoValues("Mary", "Alex"), "Alex")
     }
 }

 TestMinOfTwoValues.defaultTestSuite.run()

 /**
  Compares two values and find the greatest.
  
  - Parameters:
     - value1: First value to compare.
     - value2: Second value to compare.
  
  - Requires:
     `value1` and `value2` must conform to the `Comparable` protocol.
  
  - Returns: The greatest among input values. If the input values are equal returns the first one.
  */
 func maxOfTwoValues<T: Comparable>(_ value1: T, _ value2: T) -> T {
     value1 >= value2 ? value1 : value2
 }

 class TestMaxOfTwoValues: XCTestCase {
     func testMaxOfTwoValuesReturnsMaxValueWhenGivenTwoPositiveNumbers() {
         XCTAssertEqual(maxOfTwoValues(8, 9), 9)
         XCTAssertEqual(maxOfTwoValues(9, 8), 9)
         XCTAssertEqual(Float(maxOfTwoValues(3.1, 3.2)), 3.2)
         XCTAssertEqual(Float(maxOfTwoValues(3.2, 3.1)), 3.2)
         XCTAssertEqual(Double(maxOfTwoValues(3.012345679, 3.012345678)), 3.012345679)
         XCTAssertEqual(Double(maxOfTwoValues(3.012345678, 3.012345679)), 3.012345679)
     }

     func testMaxOfTwoValuesReturnsMaxValueWhenGivenOnePositiveAndOneNegativeNumbers() {
         XCTAssertEqual(maxOfTwoValues(1, -3), 1)
         XCTAssertEqual(maxOfTwoValues(-3, 1), 1)
         XCTAssertEqual(Float(maxOfTwoValues(1.567, -3.1234)), 1.567)
         XCTAssertEqual(Float(maxOfTwoValues(-3.1234, 1.567)), 1.567)
         XCTAssertEqual(Double(maxOfTwoValues(-3.012345679, 3.012345678)), 3.012345678)
         XCTAssertEqual(Double(maxOfTwoValues(3.012345678, -3.012345679)), 3.012345678)
     }

     func testMaxOfTwoValuesReturnsMaxValueWhenGivenTwoEqualNumbers() {
         XCTAssertEqual(maxOfTwoValues(0, 0), 0)
         XCTAssertEqual(maxOfTwoValues(1, 1), 1)
         XCTAssertEqual(Float(maxOfTwoValues(5.98765, 5.98765)), 5.98765)
         XCTAssertEqual(Double(maxOfTwoValues(3.0123456789, 3.0123456789)), 3.0123456789)
     }

     func testMaxOfTwoValuesReturnsMaxValueWhenGivenOnePositiveAndOneGreatestNumber() {
         XCTAssertEqual(maxOfTwoValues(5, Int.max), Int.max)
         XCTAssertEqual(Float(maxOfTwoValues(Float.greatestFiniteMagnitude, 5.98765)), Float.greatestFiniteMagnitude)
         XCTAssertEqual(Double(maxOfTwoValues(3.012345678, Double.greatestFiniteMagnitude)), Double.greatestFiniteMagnitude)
     }

     func testMaxOfTwoValuesReturnsMaxValueWhenGivenOneNegativeAndOneSmallestNumber() {
         XCTAssertEqual(maxOfTwoValues(-1, Int.min), -1)
     }

     func testMaxOfTwoValuesReturnsMaxValueWhenGivenOneGreatestAndOneSmallestNumber() {
         XCTAssertEqual(maxOfTwoValues(Int.max, Int.min), Int.max)
     }

     func testMaxOfTwoValuesReturnsMaxValueWhenGivenTwoCharacters() {
         XCTAssertEqual(Character(maxOfTwoValues("G", "P")), "P")
         XCTAssertEqual(Character(maxOfTwoValues("P", "G")), "P")
     }

     func testMaxOfTwoValuesReturnsMaxValueWhenGivenTwoStrings() {
         XCTAssertEqual(maxOfTwoValues("Alex", "Mary"), "Mary")
         XCTAssertEqual(maxOfTwoValues("Mary", "Alex"), "Mary")
     }
 }

 TestMaxOfTwoValues.defaultTestSuite.run()

/**
 Compares three values and find the smallest.
 First compares the first and second value and find the smallest. Then compares the smallest (from first and second value) with the third value and find the smallest.
 
 - Parameters:
    - value1: First value to compare.
    - value2: Second value to compare.
    - value3: Third value to compare.
 
 - Requires:
    `value1`, `value2` and  `value3` must  conform to the `Comparable` protocol.
 
 - Returns: The smallest among input values.
 If all input values are equal returns the first one.  If  the first and second or third values are equal (and these are the smallest values) returns the first one.
 If  the second and third values are equal (and these are the smallest values) returns the second one.
 */
 func minOfThreeValues<T: Comparable>(_ value1: T, _ value2: T, _ value3: T) -> T {
     minOfTwoValues(minOfTwoValues(value1, value2), value3)
 }

class TestMinOfThreeValues: XCTestCase {
    func testMinOfThreeValuesReturnsMinValueWhenGivenThreePositiveNumbers() {
        XCTAssertEqual(minOfThreeValues(8, 17, 25), 8)
        XCTAssertEqual(minOfThreeValues(25, 17, 8), 8)
        XCTAssertEqual(Float(minOfThreeValues(3.1, 3.2, 3.5)), 3.1)
        XCTAssertEqual(Float(minOfThreeValues(3.5, 3.2, 3.1)), 3.1)
        XCTAssertEqual(Double(minOfThreeValues(3.012345678, 3.012345677, 3.012345679)), 3.012345677)
        XCTAssertEqual(Double(minOfThreeValues(3.012345679, 3.012345678, 3.012345677)), 3.012345677)
    }
    
    func testMinOfThreeValuesReturnsMinValueWhenGivenTwoPositiveAndOneNegativeNumbers() {
        XCTAssertEqual(minOfThreeValues(1, 5, -3), -3)
        XCTAssertEqual(minOfThreeValues(-3, 1, 5), -3)
    }
    
    func testMinOfThreeValuesReturnsMinValueWhenGivenThreeEqualNumbers() {
        XCTAssertEqual(minOfThreeValues(0, 0, 0), 0)
        XCTAssertEqual(minOfThreeValues(1, 1, 1), 1)
        XCTAssertEqual(Float(minOfThreeValues(5.98765, 5.987650, 5.98765)), 5.98765)
        XCTAssertEqual(Double(minOfThreeValues(3.01234567890, 3.0123456789, 3.0123456789)), 3.0123456789)
    }
    
    func testMinOfThreeValuesReturnsMinValueWhenGivenTwoPositiveAndOneGreatestNumber() {
        XCTAssertEqual(minOfThreeValues(5, Int.max, 1), 1)
        XCTAssertEqual(Float(minOfThreeValues(Float.greatestFiniteMagnitude, 5.987650, 5.987651)), 5.987650)
        XCTAssertEqual(Double(minOfThreeValues(3.012345678, 3.012345677, Double.greatestFiniteMagnitude)), 3.012345677)
    }
    
    func testMinOfThreeValuesReturnsMinValueWhenGivenTwoNegativeAndOneSmallestNumber() {
        XCTAssertEqual(minOfThreeValues(-1, Int.min, -99), Int.min)
    }
    
    func testMinOfThreeValuesReturnsMinValueWhenGivenOneGreatestAndTwoSmallestNumber() {
        XCTAssertEqual(minOfThreeValues(Int.max, Int.min, Int.min), Int.min)
    }
    
    func testMinOfThreeValuesReturnsMinValueWhenGivenThreeCharacters() {
        XCTAssertEqual(Character(minOfThreeValues("G", "P", "W")), "G")
        XCTAssertEqual(Character(minOfThreeValues("W", "P", "G")), "G")
    }

    func testMinOfThreeValuesReturnsMinValueWhenGivenThreeStrings() {
        XCTAssertEqual(minOfThreeValues("Alex", "Mary", "Bob"), "Alex")
        XCTAssertEqual(minOfThreeValues("Mary", "Alex", "Bob"), "Alex")
    }
}
    
TestMinOfThreeValues.defaultTestSuite.run()
    
/**
 Compares three values and find the greatest.
 First compares the first and second value and find the greatest. Then compares the greatest (from first and second value) with the third value and find the greatest.
 
 - Parameters:
    - value1: First value to compare.
    - value2: Second value to compare.
    - value3: Third value to compare.
 
 - Requires:
    `value1`, `value2` and  `value3` must  conform to the `Comparable` protocol.
 
 - Returns: The greatest among input values.
 If all input values are equal returns the first one.  If  the first and second or third values are equal (and these are the greatest values) returns the first one.
 If  the second and third values are equal (and these are the greatest values) returns the second one.
 */
 func maxOfThreeValues<T: Comparable>(_ value1: T, _ value2: T, _ value3: T) -> T {
     maxOfTwoValues(maxOfTwoValues(value1, value2), value3)
 }

class TestMaxOfThreeValues: XCTestCase {
    func testMaxOfThreeValuesReturnsMaxValueWhenGivenThreePositiveNumbers() {
        XCTAssertEqual(maxOfThreeValues(8, 17, 25), 25)
        XCTAssertEqual(maxOfThreeValues(25, 17, 8), 25)
        XCTAssertEqual(Float(maxOfThreeValues(3.1, 3.2, 3.5)), 3.5)
        XCTAssertEqual(Float(maxOfThreeValues(3.5, 3.2, 3.1)), 3.5)
        XCTAssertEqual(Double(maxOfThreeValues(3.012345678, 3.012345677, 3.012345679)), 3.012345679)
        XCTAssertEqual(Double(maxOfThreeValues(3.012345679, 3.012345678, 3.012345677)), 3.012345679)
    }
    
    func testMaxOfThreeValuesReturnsMaxValueWhenGivenTwoPositiveAndOneNegativeNumbers() {
        XCTAssertEqual(maxOfThreeValues(1, 5, -9), 5)
        XCTAssertEqual(maxOfThreeValues(-9, 1, 5), 5)
    }
    
    func testMaxOfThreeValuesReturnsMaxValueWhenGivenThreeEqualNumbers() {
        XCTAssertEqual(maxOfThreeValues(0, 0, 0), 0)
        XCTAssertEqual(maxOfThreeValues(1, 1, 1), 1)
        XCTAssertEqual(Float(maxOfThreeValues(5.98765, 5.987650, 5.98765)), 5.98765)
        XCTAssertEqual(Double(maxOfThreeValues(3.01234567890, 3.0123456789, 3.0123456789)), 3.0123456789)
    }
    
    func testMaxOfThreeValuesReturnsMaxValueWhenGivenTwoPositiveAndOneGreatestNumber() {
        XCTAssertEqual(maxOfThreeValues(5, Int.max, 1), Int.max)
        XCTAssertEqual(Float(maxOfThreeValues(Float.greatestFiniteMagnitude, 5.98, 5.99)), Float.greatestFiniteMagnitude)
    }
    
    func testMaxOfThreeValuesReturnsMaxValueWhenGivenTwoNegativeAndOneSmallestNumber() {
        XCTAssertEqual(maxOfThreeValues(-1, Int.min, -99), -1)
    }
    
    func testMaxOfThreeValuesReturnsMaxValueWhenGivenOneGreatestAndTwoSmallestNumber() {
        XCTAssertEqual(maxOfThreeValues(Int.min, Int.max, Int.min), Int.max)
    }
    
    func testMaxOfThreeValuesReturnsMaxValueWhenGivenThreeCharacters() {
        XCTAssertEqual(Character(maxOfThreeValues("G", "P", "W")), "W")
        XCTAssertEqual(Character(maxOfThreeValues("W", "P", "G")), "W")
    }

    func testMaxOfThreeValuesReturnsMaxValueWhenGivenThreeStrings() {
        XCTAssertEqual(maxOfThreeValues("Alex", "Mary", "Bob"), "Mary")
        XCTAssertEqual(maxOfThreeValues("Mary", "Alex", "Bob"), "Mary")
    }
}
    
TestMaxOfThreeValues.defaultTestSuite.run()

/**
 Searches for the smallest value in an array.

 - Parameters:
    - array: The input array of elements to search in.

 - Requires:
    Elements in an `array` must conform to the `Comparable` protocol.

 - Complexity: `O(N)`, where `N` is the input size.

 - Returns: The smallest value in an array. If there are several equal values in an array and they are the smallest returns the last one.
    If `array` is empty returns `nil`.
 */
func minValue<T: Comparable>(_ array: [T]) -> T? {
    guard var minValue = array.first else { return nil }

    for value in array {
        minValue = minOfTwoValues(value, minValue)
    }

    return minValue
}

class TestMinValue: XCTestCase {
    func testMinValueReturnsMinValueWhenGivenOneOrMultiplePositiveNumbers() {
        XCTAssertEqual(minValue([15]), 15)
        XCTAssertEqual(minValue([15, 7, 3, 1, 5]), 1)
        XCTAssertEqual(minValue([3.987, 3.986, 3.985]), 3.985)
    }
    
    func testMinValueReturnsMinValueWhenGivenPositiveAndNegativeNumbers() {
        XCTAssertEqual(minValue([5, 1, -2, 8, -5]), -5)
        XCTAssertEqual(minValue([-3.987, 3.986, 3.985]), -3.987)
    }
    
    func testMinValueReturnsMinValueWhenGivenEgualNumbers() {
        XCTAssertEqual(minValue([1, 1, 1, 1, 1]), 1)
        XCTAssertEqual(minValue([0, 0, 0, 0]), 0)
        XCTAssertEqual(minValue([-1, -1, -1, -1, -1, -1]), -1)
        XCTAssertEqual(minValue([3.98555, 3.98555, 3.98555]), 3.98555)
    }
    
    func testMinValueReturnsMinValueWhenGivenGreatestAndPositiveNumbers() {
        XCTAssertEqual(minValue([8, 1, 15, Int.max, 9]), 1)
        XCTAssertEqual(minValue([3.98558, 3.98556, Double.greatestFiniteMagnitude, 3.98555]), 3.98555)
    }
    
    func testMinValueReturnsMinValueWhenGivenSmallestAndNegativeNumbers() {
        XCTAssertEqual(minValue([-8, -1, -15, Int.min, -9]), Int.min)
    }
    
    func testMinValueReturnsMinValueWhenGivenSmallestAndGreatestNumbers() {
        XCTAssertEqual(minValue([Int.max, 1, 0, Int.min, 9]), Int.min)
        XCTAssertEqual(minValue([Int.max, -10, 0, Int.min, -91]), Int.min)
    }

    func testMinValueReturnsMinValueWhenGivenStrings() {
        XCTAssertEqual(minValue(["Alex", "Mary", "Bob"]), "Alex")
        XCTAssertEqual(minValue(["Mary", "Alex", "Bob"]), "Alex")
    }
    
    func testMinValueReturnsMinValueWhenGivenAnEmptyArray() {
        XCTAssertNil(minValue([Int]()))
    }
}

TestMinValue.defaultTestSuite.run()

/**
 Searches for the greatest value in an array.

 - Parameters:
    - array: The input array of elements to search in.

 - Requires:
    Elements in an `array` must conform to the `Comparable` protocol.

 - Complexity: `O(N)`, where `N` is the input size.

 - Returns: The greatest value in an array. If there are several equal values in an array and they are the greatest returns the last one.
    If `array` is empty returns `nil`.
 */
func maxValue<T: Comparable>(_ array: [T]) -> T? {
    guard var maxValue = array.first else { return nil }

    for value in array {
        maxValue = maxOfTwoValues(value, maxValue)
    }

    return maxValue
}

class TestMaxValue: XCTestCase {
    func testMaxValueReturnsMaxValueWhenGivenOneOrMultiplePositiveNumbers() {
        XCTAssertEqual(maxValue([1]), 1)
        XCTAssertEqual(maxValue([5, 7, 3, 1, 15]), 15)
        XCTAssertEqual(maxValue([3.987, 3.986, 3.985]), 3.987)
    }
    
    func testMaxValueReturnsMaxValueWhenGivenPositiveAndNegativeNumbers() {
        XCTAssertEqual(maxValue([5, 1, -2, 8, -5]), 8)
        XCTAssertEqual(maxValue([-3.987, 3.986, 3.985]), 3.986)
    }
    
    func testMaxValueReturnsMaxValueWhenGivenEgualNumbers() {
        XCTAssertEqual(maxValue([1, 1, 1, 1, 1]), 1)
        XCTAssertEqual(maxValue([0, 0, 0, 0]), 0)
        XCTAssertEqual(maxValue([-1, -1, -1, -1, -1, -1]), -1)
        XCTAssertEqual(maxValue([3.98555, 3.98555, 3.98555]), 3.98555)
    }
    
    func testMaxValueReturnsMaxValueWhenGivenGreatestAndPositiveNumbers() {
        XCTAssertEqual(maxValue([8, 1, 15, Int.max, 9]), Int.max)
        XCTAssertEqual(maxValue([3.98, 3.97, Double.greatestFiniteMagnitude, 3.99]), Double.greatestFiniteMagnitude)
    }
    
    func testMaxValueReturnsMaxValueWhenGivenSmallestAndNegativeNumbers() {
        XCTAssertEqual(maxValue([-8, -1, -15, Int.min, -9]), -1)
    }
    
    func testMaxValueReturnsMaxValueWhenGivenSmallestAndGreatestNumbers() {
        XCTAssertEqual(maxValue([Int.max, 1, 0, Int.min, 9]), Int.max)
        XCTAssertEqual(maxValue([Int.max, -10, 0, Int.min, -91]), Int.max)
    }

    func testMaxValueReturnsMaxValueWhenGivenStrings() {
        XCTAssertEqual(maxValue(["Alex", "Mary", "Bob"]), "Mary")
        XCTAssertEqual(maxValue(["Mary", "Alex", "Bob"]), "Mary")
    }
    
    func testMaxValueReturnsMaxValueWhenGivenAnEmptyArray() {
        XCTAssertNil(maxValue([Int]()))
    }
}

TestMaxValue.defaultTestSuite.run()
