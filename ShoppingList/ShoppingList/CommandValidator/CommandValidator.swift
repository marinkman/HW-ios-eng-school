/// Represents a validator of the command entered by user.
enum CommandValidator {
    // MARK: - Internal Interface

    /**
     Checks if the input string is a valid command.
     - Parameter possibleCommand: The string to check.
     - Returns: `Result` representing the success or failure of the validation.
     In case of success the `Result` containts an associated value `Command`,
     otherwise it contains `ValidatorError`.
     */
    func validate(_ possibleCommand: String) -> Result<Command, ValidatorError> {
        guard !possibleCommand.isEmpty else {
            return .failure(.missingCommand)
        }
        switch possibleCommand {
        case Command.add.rawValue:
            return .success(.add)
        case Command.remove.rawValue:
            return .success(.remove)
        case Command.removeAt.rawValue:
            return .success(.removeAt)
        case Command.show.rawValue:
            return .success(.show)
        case Command.help.rawValue:
            return .success(.help)
        case Command.exit.rawValue:
            return .success(.exit)
        default:
            return .failure(.unexpectedCommand(possibleCommand))
        }
    }
}
