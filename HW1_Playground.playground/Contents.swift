func minNumber(_ number1: Int, _ number2: Int) -> Int {
    number1 <= number2 ? number1 : number2
}

minNumber(1, -3)


func maxNumber(_ number1: Int, _ number2: Int) -> Int {
    number1 >= number2 ? number1 : number2
}

maxNumber(7, -9)


func minBetweenThreeNumbers(_ number1: Int, _ number2: Int, _ number3: Int)  -> Int {
    if number1 <= number2 && number1 <= number3 {
        return number1
    } else if number2 <= number1 && number2 <= number3 {
        return number2
    } else {
        return number3
    }
}

minBetweenThreeNumbers(1, -9, 0)


func maxBetweenThreeNumbers(_ number1: Int, _ number2: Int, _ number3: Int)  -> Int {
    if number1 >= number2 && number1 >= number3 {
        return number1
    } else if number2 >= number1 && number2 >= number3 {
        return number2
    } else {
        return number3
    }
}

maxBetweenThreeNumbers(-6, -6, 1)


func returnMinValue(_ array: [Int]) -> Int? {
    var minValue = array.first
    
    for value in array {
        if value < minValue ?? value {
            minValue = value
        }
    }
    
    return minValue
}

returnMinValue([1, 4, -1, 48, -32])


func returnMaxValue(_ array: [Int]) -> Int? {
    var maxValue = array.first
    
    for value in array {
        if value > maxValue ?? value {
            maxValue = value
        }
    }
    
    return maxValue
}

returnMaxValue([1, 4, -1, -58, -32])


func returnMinValueDouble(_ array: [Double]) -> Double? {
    var minValueDouble = array.first
    
    for value in array {
        if value < minValueDouble ?? value {
            minValueDouble = value
        }
    }
    
    return minValueDouble
}

returnMinValueDouble([1.2, 0.4, -1.9, 48.3, -0.005])


func returnMaxValueDouble(_ array: [Double]) -> Double? {
    var maxValueDouble = array.first
    
    for value in array {
        if value > maxValueDouble ?? value {
            maxValueDouble = value
        }
    }
    
    return maxValueDouble
}

returnMaxValueDouble([1.2, 0.4, -1.9, 48.3, -0.005])


