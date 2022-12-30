func minOfTwoNumbers(_ number1: Int, _ number2: Int) -> Int {
    number1 <= number2 ? number1 : number2
}

assert(minOfTwoNumbers(1, -3) == -3)
assert(minOfTwoNumbers(-3, 1) == -3)
assert(minOfTwoNumbers(0, 0) == 0)
assert(minOfTwoNumbers(1, 1) == 1)
assert(minOfTwoNumbers(5, Int.max) == 5)
assert(minOfTwoNumbers(1, Int.min) == Int.min)
assert(minOfTwoNumbers(Int.max, Int.min) == Int.min)

func maxOfTwoNumbers(_ number1: Int, _ number2: Int) -> Int {
    number1 >= number2 ? number1 : number2
}

assert(maxOfTwoNumbers(1, -3) == 1)
assert(maxOfTwoNumbers(-3, 1) == 1)
assert(maxOfTwoNumbers(0, 0) == 0)
assert(maxOfTwoNumbers(1, 1) == 1)
assert(maxOfTwoNumbers(5, Int.max) == Int.max)
assert(maxOfTwoNumbers(1, Int.min) == 1)
assert(maxOfTwoNumbers(Int.max, Int.min) == Int.max)

func minOfThreeNumbers(_ number1: Int, _ number2: Int, _ number3: Int)  -> Int {
    minOfTwoNumbers(minOfTwoNumbers(number1,number2), number3)
}
    
assert(minOfThreeNumbers(-6, 1, 0) == -6)
assert(minOfThreeNumbers(1, 0, -6) == -6)
assert(minOfThreeNumbers(0, 0, 0) == 0)
assert(minOfThreeNumbers(1, 1, 1) == 1)
assert(minOfThreeNumbers(0, -1, 0) == -1)
assert(minOfThreeNumbers(0, Int.min, -1) == Int.min)
assert(minOfThreeNumbers(-5, 10, Int.max) == -5)
assert(minOfThreeNumbers(Int.max, 0, Int.min) == Int.min)

func maxOfThreeNumbers(_ number1: Int, _ number2: Int, _ number3: Int)  -> Int {
    maxOfTwoNumbers(maxOfTwoNumbers(number1, number2), number3)
}

assert(maxOfThreeNumbers(-6, 1, 0) == 1)
assert(maxOfThreeNumbers(1, 0, -6) == 1)
assert(maxOfThreeNumbers(0, 0, 0) == 0)
assert(maxOfThreeNumbers(1, 1, 1) == 1)
assert(maxOfThreeNumbers(0, -1, 0) == 0)
assert(maxOfThreeNumbers(0, Int.min, -1) == 0)
assert(maxOfThreeNumbers(-5, 10, Int.max) == Int.max)
assert(maxOfThreeNumbers(Int.max, 0, Int.min) == Int.max)

func minValue(_ array: [Int]) -> Int? {
    guard var minValue = array.first else { return nil }
    
    for value in array {
        minValue = minOfTwoNumbers(value, minValue)
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
assert(minValue([]) == nil)

func maxValue(_ array: [Int]) -> Int? {
    guard var maxValue = array.first else { return nil }
    
    for value in array {
        maxValue = maxOfTwoNumbers(value, maxValue)
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
assert(maxValue([]) == nil)

func minValueDouble(_ array: [Double]) -> Double? {
    guard var minValueDouble = array.first else { return nil }
    
    for value in array {
        if value < minValueDouble {
            minValueDouble = value
        }
    }
    
    return minValueDouble
}

assert(minValueDouble([1.2, 0.4, -1.9, 48.3, -0.005]) == -1.9)
assert(minValueDouble([1.2, 0.4, 1.9, 48.3, -0.005]) == -0.005)
assert(minValueDouble([0.0, 0.0, 0.0, 0.0]) == 0.0)
assert(minValueDouble([1.0, 1.0, 1.0]) == 1.0)
assert(minValueDouble([0.0, 0.1, 0.1, 0.0, -0.1]) == -0.1)
assert(minValueDouble([Double.greatestFiniteMagnitude, Double.leastNonzeroMagnitude]) == Double.leastNonzeroMagnitude)
assert(minValueDouble([0.0, -99.99, Double.leastNonzeroMagnitude]) == -99.99)
assert(minValueDouble([]) == nil)

func maxValueDouble(_ array: [Double]) -> Double? {
    guard var maxValueDouble = array.first else { return nil }
    
    for value in array {
        if value > maxValueDouble {
            maxValueDouble = value
        }
    }
    
    return maxValueDouble
}

assert(maxValueDouble([1.2, 0.4, -1.9, 48.3, -0.005]) == 48.3)
assert(maxValueDouble([1.2, 0.4, 1.9, -48.3, -0.005]) == 1.9)
assert(maxValueDouble([0.0, 0.0, 0.0, 0.0]) == 0.0)
assert(maxValueDouble([1.0, 1.0, 1.0]) == 1.0)
assert(maxValueDouble([0.0, 0.1, 0.1, 0.0, -0.1]) == 0.1)
assert(maxValueDouble([Double.greatestFiniteMagnitude, Double.leastNonzeroMagnitude]) == Double.greatestFiniteMagnitude)
assert(maxValueDouble([0.9, -99.99, Double.leastNonzeroMagnitude]) == 0.9)
assert(maxValueDouble([]) == nil)
