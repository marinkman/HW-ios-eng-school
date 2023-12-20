enum Parser {
    static func parse(_ rawArguments: [String]) throws -> ParsedArgument {
        guard let firstArgument = rawArguments.first else {
            throw ParserError.missingArguments
        }

        let possibleNumbers = Array(rawArguments.dropFirst())

        switch firstArgument {
        case Command.calculateMedian:
            let parsedNumbers = try convertStringsToInts(possibleNumbers)
            let arguments = ParsedArgument(
                commandName: Command.calculateMedian,
                parameters: parsedNumbers
            )

            return arguments

        case Command.calculateMean:
            let parsedNumbers = try convertStringsToInts(possibleNumbers)
            let arguments = ParsedArgument(
                commandName: Command.calculateMean,
                parameters: parsedNumbers
            )

            return arguments

        case Command.calculateMode:
            let parsedNumbers = try convertStringsToInts(possibleNumbers)
            let arguments = ParsedArgument(
                commandName: Command.calculateMode,
                parameters: parsedNumbers
            )

            return arguments

        case Command.showHelp:
            let arguments = ParsedArgument(
                commandName: Command.showHelp
            )

            return arguments

        default:
            let parsedNumbers = try convertStringsToInts(rawArguments)
            let arguments = ParsedArgument(
                commandName: Command.calculateAllStatistics,
                parameters: parsedNumbers
            )

            return arguments
        }
    }

    private static func convertStringsToInts(_ line: [String]) throws -> [Int] {
        guard !line.isEmpty else { throw ParserError.missingArguments }

        var numbers = [Int]()

        for element in line {
            if let number = Int(element) {
                numbers.append(number)
            } else { throw ParserError.invalidArguments }
        }

        return numbers
    }
}
