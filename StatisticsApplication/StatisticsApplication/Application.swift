struct Application {
    /// Starts the application
    func run() {
        let argumentsCount = CommandLine.argc
        var arguments = [String]()

        let mode = Mode.setTheMode(argumentsCount)

        switch mode {
        case .staticMode:
            arguments = CommandLine.arguments
            arguments.removeFirst()

        case .interactiveMode:
            do {
                arguments = try ConsoleIO.readInput()
            } catch {
                ConsoleIO.writeMessage(ErrorInReadingInput.failure.errorMessage, to: .error)
            }
        }
    }
}
