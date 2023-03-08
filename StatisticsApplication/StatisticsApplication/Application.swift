struct Application {
    /// Starts the application
    func run() {
        let argumentsCount = CommandLine.argc
        var arguments = [String]()

        let mode = Mode.unknownMode.setTheMode(argumentsCount)

        switch mode {
        case .staticMode:
            arguments = CommandLine.arguments
            arguments.removeFirst()

        case .interactiveMode:
            arguments = ConsoleIO.readInput()

        default:
            break
        }
    }
}
