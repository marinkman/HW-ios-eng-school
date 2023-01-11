import XCTest

func minOfTwoNumbers(_ number1: Int, _ number2: Int) -> Int {
    number1 <= number2 ? number1 : number2
}
XCTAssert(minOfTwoNumbers(1, -3) == -3)
XCTAssert(minOfTwoNumbers(-3, 1) == -3)
XCTAssert(minOfTwoNumbers(0, 0) == 0)
XCTAssert(minOfTwoNumbers(1, 1) == 1)
XCTAssert(minOfTwoNumbers(5, Int.max) == 5)
XCTAssert(minOfTwoNumbers(1, Int.min) == Int.min)
XCTAssert(minOfTwoNumbers(Int.max, Int.min) == Int.min)

func maxOfTwoNumbers(_ number1: Int, _ number2: Int) -> Int {
    number1 >= number2 ? number1 : number2
}

XCTAssert(maxOfTwoNumbers(1, -3) == 1)
XCTAssert(maxOfTwoNumbers(-3, 1) == 1)
XCTAssert(maxOfTwoNumbers(0, 0) == 0)
XCTAssert(maxOfTwoNumbers(1, 1) == 1)
XCTAssert(maxOfTwoNumbers(5, Int.max) == Int.max)
XCTAssert(maxOfTwoNumbers(1, Int.min) == 1)
XCTAssert(maxOfTwoNumbers(Int.max, Int.min) == Int.max)

func minOfThreeNumbers(_ number1: Int, _ number2: Int, _ number3: Int)  -> Int {
    minOfTwoNumbers(minOfTwoNumbers(number1,number2), number3)
}
    
XCTAssert(minOfThreeNumbers(-6, 1, 0) == -6)
XCTAssert(minOfThreeNumbers(1, 0, -6) == -6)
XCTAssert(minOfThreeNumbers(0, 0, 0) == 0)
XCTAssert(minOfThreeNumbers(1, 1, 1) == 1)
XCTAssert(minOfThreeNumbers(0, -1, 0) == -1)
XCTAssert(minOfThreeNumbers(0, Int.min, -1) == Int.min)
XCTAssert(minOfThreeNumbers(-5, 10, Int.max) == -5)
XCTAssert(minOfThreeNumbers(Int.max, 0, Int.min) == Int.min)

func maxOfThreeNumbers(_ number1: Int, _ number2: Int, _ number3: Int)  -> Int {
    maxOfTwoNumbers(maxOfTwoNumbers(number1, number2), number3)
}

XCTAssert(maxOfThreeNumbers(-6, 1, 0) == 1)
XCTAssert(maxOfThreeNumbers(1, 0, -6) == 1)
XCTAssert(maxOfThreeNumbers(0, 0, 0) == 0)
XCTAssert(maxOfThreeNumbers(1, 1, 1) == 1)
XCTAssert(maxOfThreeNumbers(0, -1, 0) == 0)
XCTAssert(maxOfThreeNumbers(0, Int.min, -1) == 0)
XCTAssert(maxOfThreeNumbers(-5, 10, Int.max) == Int.max)
XCTAssert(maxOfThreeNumbers(Int.max, 0, Int.min) == Int.max)

func minValue(_ array: [Int]) -> Int? {
    guard var minValue = array.first else { return nil }
    
    for value in array {
        minValue = minOfTwoNumbers(value, minValue)
    }
    
    return minValue
}

XCTAssert(minValue([1, 4, -1, 48, -32]) == -32)
XCTAssert(minValue([1, 4, -1, -48, 32]) == -48)
XCTAssert(minValue([0, 0, 0, 0]) == 0)
XCTAssert(minValue([1, 1, 1]) == 1)
XCTAssert(minValue([1, 0, -1, -1, 0]) == -1)
XCTAssert(minValue([0, Int.min, -183]) == Int.min)
XCTAssert(minValue([-99, 0, -1, Int.max, Int.min]) == Int.min)
XCTAssert(minValue([183, Int.max, -183]) == -183)
XCTAssert(minValue([]) == nil)

func maxValue(_ array: [Int]) -> Int? {
    guard var maxValue = array.first else { return nil }
    
    for value in array {
        maxValue = maxOfTwoNumbers(value, maxValue)
    }
    
    return maxValue
}

XCTAssert(maxValue([1, 4, -1, 48, -32]) == 48)
XCTAssert(maxValue([1, 4, -1, -48, 32]) == 32)
XCTAssert(maxValue([0, 0, 0, 0]) == 0)
XCTAssert(maxValue([1, 1, 1]) == 1)
XCTAssert(maxValue([1, 0, -1, -1, 0]) == 1)
XCTAssert(maxValue([0, Int.min, -183]) == 0)
XCTAssert(maxValue([-99, Int.max, Int.min]) == Int.max)
XCTAssert(maxValue([183, 0, -1, Int.max, -183]) == Int.max)
XCTAssert(maxValue([]) == nil)

func minValueDouble(_ array: [Double]) -> Double? {
    guard var minValueDouble = array.first else { return nil }
    
    for value in array {
        if value < minValueDouble {
            minValueDouble = value
        }
    }
    
    return minValueDouble
}

XCTAssert(minValueDouble([1.2, 0.4, -1.9, 48.3, -0.005]) == -1.9)
XCTAssert(minValueDouble([1.2, 0.4, 1.9, 48.3, -0.005]) == -0.005)
XCTAssert(minValueDouble([0.0, 0.0, 0.0, 0.0]) == 0.0)
XCTAssert(minValueDouble([1.0, 1.0, 1.0]) == 1.0)
XCTAssert(minValueDouble([0.0, 0.1, 0.1, 0.0, -0.1]) == -0.1)
XCTAssert(minValueDouble([Double.greatestFiniteMagnitude, Double.leastNonzeroMagnitude]) == Double.leastNonzeroMagnitude)
XCTAssert(minValueDouble([0.0, -99.99, Double.leastNonzeroMagnitude]) == -99.99)
XCTAssert(minValueDouble([]) == nil)

func maxValueDouble(_ array: [Double]) -> Double? {
    guard var maxValueDouble = array.first else { return nil }
    
    for value in array {
        if value > maxValueDouble {
            maxValueDouble = value
        }
    }
    
    return maxValueDouble
}

XCTAssert(maxValueDouble([1.2, 0.4, -1.9, 48.3, -0.005]) == 48.3)
XCTAssert(maxValueDouble([1.2, 0.4, 1.9, -48.3, -0.005]) == 1.9)
XCTAssert(maxValueDouble([0.0, 0.0, 0.0, 0.0]) == 0.0)
XCTAssert(maxValueDouble([1.0, 1.0, 1.0]) == 1.0)
XCTAssert(maxValueDouble([0.0, 0.1, 0.1, 0.0, -0.1]) == 0.1)
XCTAssert(maxValueDouble([Double.greatestFiniteMagnitude, Double.leastNonzeroMagnitude]) == Double.greatestFiniteMagnitude)
XCTAssert(maxValueDouble([0.9, -99.99, Double.leastNonzeroMagnitude]) == 0.9)
XCTAssert(maxValueDouble([]) == nil)
