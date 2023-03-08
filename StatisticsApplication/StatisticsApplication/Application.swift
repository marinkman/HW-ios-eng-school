struct Application {
    func run() {
        var arguments = CommandLine.arguments
        let programNamePath = arguments.removeFirst()
        ConsoleIO.writeMessage("\(arguments)")
    }
}
