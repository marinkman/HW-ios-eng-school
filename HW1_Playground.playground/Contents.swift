func minOfTwoNumber(_ number1: Int, _ number2: Int) -> Int {
    number1 <= number2 ? number1 : number2
}

minOfTwoNumber(1, -3)
assert(minOfTwoNumber(1, -3) == -3)

func maxOfTwoNumber(_ number1: Int, _ number2: Int) -> Int {
    number1 >= number2 ? number1 : number2
}

maxOfTwoNumber(7, -9)
assert(maxOfTwoNumber(7, -9) == 7)

func minOfThreeNumbers(_ number1: Int, _ number2: Int, _ number3: Int)  -> Int {
    minOfTwoNumber(minOfTwoNumber(number1,number2), number3)
}
    
minOfThreeNumbers(0, -6, 1)
assert(minOfThreeNumbers(0, -6, 1) == -6)

func maxOfThreeNumbers(_ number1: Int, _ number2: Int, _ number3: Int)  -> Int {
    maxOfTwoNumber(maxOfTwoNumber(number1, number2), number3)
}

maxOfThreeNumbers(-6, -6, 1)
assert(maxOfThreeNumbers(-6, -6, 1) == 1)

func minValue(_ array: [Int]) -> Int? {
    guard var minValue = array.first else { return nil }
    
    for value in array {
        minValue = minOfTwoNumber(value, minValue)
    }
    
    return minValue
}

minValue([1, 4, -1, 48, -32])
assert(minValue([1, 4, -1, 48, -32]) == -32)

func maxValue(_ array: [Int]) -> Int? {
    guard var maxValue = array.first else { return nil }
    
    for value in array {
        maxValue = maxOfTwoNumber(value, maxValue)
    }
    
    return maxValue
}

maxValue([1, 4, -1, -58, -32])
assert(maxValue([1, 4, -1, -58, -32]) == 4)

func minValueDouble(_ array: [Double]) -> Double? {
    guard var minValueDouble = array.first else { return nil }
    
    for value in array {
        if value < minValueDouble {
            minValueDouble = value
        }
    }
    
    return minValueDouble
}

minValueDouble([1.2, 0.4, -1.9, 48.3, -0.005])
assert(minValueDouble([1.2, 0.4, -1.9, 48.3, -0.005]) == -1.9)

func maxValueDouble(_ array: [Double]) -> Double? {
    guard var maxValueDouble = array.first else { return nil }
    
    for value in array {
        if value > maxValueDouble {
            maxValueDouble = value
        }
    }
    
    return maxValueDouble
}

maxValueDouble([1.2, 0.4, -1.9, 48.3, -0.005])
assert(maxValueDouble([1.2, 0.4, -1.9, 48.3, -0.005]) == 48.3)
