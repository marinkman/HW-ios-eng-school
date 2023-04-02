/// Represents the application help.
enum Help {
    /// Contains information about the commands supported by the application.
    static let message = """

    Supported commands:

       \(Command.add.rawValue) - \(Command.add.help)
       \(Command.remove.rawValue) - \(Command.remove.help)
       \(Command.removeAt.rawValue) - \(Command.removeAt.help)
       \(Command.show.rawValue) - \(Command.show.help)
       \(Command.help.rawValue) - \(Command.help.help)
       \(Command.exit.rawValue) - \(Command.exit.help)

    """
}
