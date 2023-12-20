enum CoreLogic {
    static func mean(_ numbers: [Int]) -> Double {
        guard !numbers.isEmpty else { return 0.0 }

        var sum = 0.0

        for number in numbers {
            sum += Double(number)
        }

        return sum / Double(numbers.count)
    }

    static func median(_ numbers: [Int]) -> Double {
        guard !numbers.isEmpty else { return 0.0 }

        let sortedNumbers = numbers.sorted()
        let size = sortedNumbers.count

        if size.isMultiple(of: 2) {
            return Double(sortedNumbers[(size / 2) - 1] + sortedNumbers[size / 2]) / 2
        } else {
            return Double(sortedNumbers[(size - 1) / 2])
        }
    }

    static func mode(_ numbers: [Int]) -> [Int] {
        var numberCounter = [Int: Int]()

        for number in numbers {
            numberCounter[number] = (numberCounter[number] ?? 0) + 1
        }

        guard let (_, numberOfRepetition) = numberCounter.max(by: { $0.1 < $1.1 }) else { return [] }

        let sameNumbers = numberCounter.filter { $0.value == numberOfRepetition }

        return sameNumbers.map(\.key)
    }
}
