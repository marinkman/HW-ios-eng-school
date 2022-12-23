func minOfTwoNumber(_ number1: Int, _ number2: Int) -> Int {
    number1 <= number2 ? number1 : number2
}

minOfTwoNumber(1, -3)


func maxOfTwoNumber(_ number1: Int, _ number2: Int) -> Int {
    number1 >= number2 ? number1 : number2
}

maxOfTwoNumber(7, -9)


func minOfThreeNumbers(_ number1: Int, _ number2: Int, _ number3: Int)  -> Int {
    minOfTwoNumber(number1, number2) <= number3 ? minOfTwoNumber(number1, number2) : number3
}
    
minOfThreeNumbers(0, -6, 1)


func maxOfThreeNumbers(_ number1: Int, _ number2: Int, _ number3: Int)  -> Int {
    maxOfTwoNumber(number1, number2) >= number3 ? maxOfTwoNumber(number1, number2) : number3
}

maxOfThreeNumbers(-6, -6, 1)


func minValue(_ array: [Int]) -> Int? {
    guard var minValue = array.first else { return nil }
    
    for value in array {
        if value < minValue {
            minValue = value
        }
    }
    
    return minValue
}

minValue([1, 4, -1, 48, -32])


func maxValue(_ array: [Int]) -> Int? {
    guard var maxValue = array.first else { return nil }
    
    for value in array {
        if value > maxValue {
            maxValue = value
        }
    }
    
    return maxValue
}

maxValue([1, 4, -1, -58, -32])


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


