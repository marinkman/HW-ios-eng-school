/// Represents the application.
struct Application {
    /// Starts the application.
    func run() {
        let argumentsCount = CommandLine.argc

        let mode = setTheMode(argumentsCount)

        let possibleArguments = readLine(mode)

        let arguments = getArguments(possibleArguments)

        executeCommand(with: arguments)
    }

    private func setTheMode(_ numberOfArguments: Int32) -> Mode {
        if numberOfArguments < 2 {
            return Mode.interactiveMode
        } else { return Mode.staticMode }
    }

    private func readLine(_ mode: Mode) -> [String] {
        var arguments = [String]()

        switch mode {
        case .staticMode:
            arguments = CommandLine.arguments
            arguments.removeFirst()

        case .interactiveMode:
            do {
                arguments = try ConsoleIO.readInput()
            } catch {
                ConsoleIO.writeMessage(ConsoleIOError.failureToReadInput.errorMessage, to: .error)
            }
        }
        return arguments
    }

    private func getArguments(_ line: [String]) -> ParsedArgument {
        var arguments = ParsedArgument()

        do {
            arguments = try Parser.parse(line)
        } catch ParserError.invalidArguments {
            ConsoleIO.writeMessage(ParserError.invalidArguments.errorMessage, to: .error)
        } catch ParserError.missingArguments {
            ConsoleIO.writeMessage(ParserError.missingArguments.errorMessage, to: .error)
        } catch {
            ConsoleIO.writeMessage(ParserError.unknownError.errorMessage, to: .error)
        }
        return arguments
    }

    private func executeCommand(with arguments: ParsedArgument) {
        let numbers = arguments.parameters

        switch arguments.commandName {
        case Command.calculateMedian:
            let median = CoreLogic.median(numbers)
            ConsoleIO.writeMessage("median: \(median)")

        case Command.calculateMean:
            let mean = CoreLogic.mean(numbers)
            ConsoleIO.writeMessage("mean: \(mean)")

        case Command.calculateMode:
            let mode = CoreLogic.mode(numbers)
            let stringMode = mode.map { String($0) }
            let stringModes = stringMode.joined(separator: ", ")
            ConsoleIO.writeMessage("mode: " + stringModes)

        case Command.calculateAllStatistics:
            let median = CoreLogic.median(numbers)
            let mean = CoreLogic.mean(numbers)
            let mode = CoreLogic.mode(numbers)
            let stringMode = mode.map { String($0) }
            let stringModes = stringMode.joined(separator: ", ")
            ConsoleIO.writeMessage("median: \(median)\nmean: \(mean)\nmode: " + stringModes)

        case Command.showHelp:
            ConsoleIO.writeMessage(Help.message)

        default:
            break
        }
    }
}
