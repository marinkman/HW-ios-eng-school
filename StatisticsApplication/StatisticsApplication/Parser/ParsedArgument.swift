struct ParsedArgument {
    let commandName: String
    let parameters: [Int]

    init(commandName: String = "", parameters: [Int] = []) {
        self.commandName = commandName
        self.parameters = parameters
    }
}
