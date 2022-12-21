
func minNumber(_ number1: Int, _ number2: Int) {
    if number1 < number2 {
        number1
    } else if number1 > number2 {
        number2
    } else if number1 == number2 {
        "Numbers are egual"
    }
}

minNumber(0, 0)

func maxNumber(_ number1: Int, _ number2: Int) {
    if number1 > number2 {
        number1
    } else if number1 < number2 {
        number2
    } else if number1 == number2 {
        "Numbers are egual"
    }
}

maxNumber(7, -9)


func minBetweenThreeNumbers(_ number1: Int, _ number2: Int, _ number3: Int)  {
    if number1 <= number2 && number1 < number3 {
        number1
    } else if number2 <= number1 && number2 < number3 {
        number2
    } else if number3 <= number2 && number3 < number1 {
        number3
    } else if number1 <= number3 && number1 < number2 {
        number1
    } else if number1 == number2 && number1 == number3 {
        "All numbers are equal"
    }
}

minBetweenThreeNumbers(3, -9, 0)


func maxBetweenThreeNumbers(_ number1: Int, _ number2: Int, _ number3: Int)  {
    if number1 >= number2 && number1 > number3 {
        number1
    } else if number2 >= number1 && number2 > number3 {
        number2
    } else if number3 >= number2 && number3 > number1 {
        number3
    } else if number1 >= number3 && number1 > number2 {
        number1
    } else if number1 == number2 && number1 == number3 {
        "All numbers are equal"
    }
}

maxBetweenThreeNumbers(6, 6, 1)

func returnMinValue(_ array: [Int]) -> Int? {
    if array.isEmpty { return nil }
    var minValue = array.first
    for value in array {
        if value < minValue! {
            minValue = value
        }
    }
    return minValue
}

returnMinValue([1, 4, -1, 48, -32])

func returnMaxValue(_ array: [Int]) -> Int? {
    if array.isEmpty { return nil }
    var maxValue = array.first
    for value in array {
        if value > maxValue! {
            maxValue = value
        }
    }
    return maxValue
}

returnMaxValue([1, 4, -1, -58, -32])

func returnMinValueDouble(_ array: [Double]) -> Double? {
    if array.isEmpty { return nil }
    var minValueDouble = array.first
    for value in array {
        if value < minValueDouble! {
            minValueDouble = value
        }
    }
    return minValueDouble
}

returnMinValueDouble([1.2, 0.4, -1.9, 48.3, -0.05])

func returnMaxValueDouble(_ array: [Double]) -> Double? {
    if array.isEmpty { return nil }
    var maxValueDouble = array.first
    for value in array {
        if value > maxValueDouble! {
            maxValueDouble = value
        }
    }
    return maxValueDouble
}

returnMaxValueDouble([1.2, 0.4, -1.9, 48.3, -0.05])
