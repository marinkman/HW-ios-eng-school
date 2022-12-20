//min between 2 integer numbers

func minNumber(number1: Int, number2: Int) {
    if number1 < number2 {
        print(number1)
    }
    else if number1 > number2 {
        print(number2)
    }
    else if number1 == number2 {
        print("Numbers are egual")
    }
}
minNumber(number1: -9, number2: 4)



//max between 2 integer numbers

func maxNumber(number1: Int, number2: Int) {
    if number1 > number2 {
        print(number1)
    }
    else if number1 < number2 {
        print(number2)
    }
    else if number1 == number2 {
        print("Numbers are egual")
    }
}
maxNumber(number1: 9, number2: 9)



//min between 3 integer numbers

func minBetweenTreeNumbers(number1: Int, number2: Int, number3: Int)  {
    if number1 <= number2 && number1 < number3 {
        print(number1)
    }
    else if number2 <= number1 && number2 < number3 {
        print(number2)
    }
    else if number3 <= number2 && number3 < number1 {
        print(number3)
    }
    else if number1 <= number3 && number1 < number2 {
        print(number1)
    }
    else if number1 == number2 && number1 == number3 {
        print("All numbers are equal")
    }
}
minBetweenTreeNumbers(number1: 1, number2: 1, number3: 1)



//max between 3 integer numbers

func maxBetweenTreeNumbers(number1: Int, number2: Int, number3: Int)  {
    if number1 >= number2 && number1 > number3 {
        print(number1)
    }
    else if number2 >= number1 && number2 > number3 {
        print(number2)
    }
    else if number3 >= number2 && number3 > number1 {
        print(number3)
    }
    else if number1 >= number3 && number1 > number2 {
        print(number1)
    }
    else if number1 == number2 && number1 == number3 {
        print("All numbers are equal")
    }
}
maxBetweenTreeNumbers(number1: 387, number2: 387, number3: -3736)


 
//min in the array of Ints

func returnMinValue(array: [Int]) -> Int? {
    if array.isEmpty { return nil }
    var minValue = array[0]
    for value in array[1..<array.count] {
       if value < minValue {
                minValue = value
        }
    }
    return minValue
}
if let minValue1 = returnMinValue(array: [1, 4, -1, 48, -32]) {
    print("\(minValue1)")
}
else { print("Array is empty")
}



//max in the array of Ints

func returnMaxValue(array: [Int]) -> Int? {
    if array.isEmpty { return nil }
    var maxValue = array[0]
    for value in array[1..<array.count] {
        if value > maxValue {
            maxValue = value
        }
    }
    return maxValue
}
if let maxValue1 = returnMaxValue(array: [1, 4, -1, 48, -32]) {
    print("\(maxValue1)")
}
else { print("Array is empty")
}



//min in the array of Doubles

func returnMinValueDouble(array: [Double]) -> Double? {
    if array.isEmpty { return nil }
    var minValueDouble = array[0]
    for value in array[1..<array.count] {
        if value < minValueDouble {
            minValueDouble = value
        }
    }
    return minValueDouble
}
if let minValueDouble1 = returnMinValueDouble(array: [1.2, 0.4, -1.9, 48.3, -0.05]) {
    print("\(minValueDouble1)")
}
else { print("Array is empty")
}



//max in the array of Doubles

func returnMaxValueDouble(array: [Double]) -> Double? {
    if array.isEmpty { return nil }
    var maxValueDouble = array[0]
    for value in array[1..<array.count] {
        if value > maxValueDouble {
            maxValueDouble = value
        }
    }
    return maxValueDouble
}
if let maxValueDouble1 = returnMaxValueDouble(array: [1.2, 0.4, -1.9, 48.3, -0.05]) {
    print("\(maxValueDouble1)")
}
else { print("Array is empty")
}
