/// Represents the application prompt message.
enum ApplicationPrompt {
    // MARK: - Internal interface

    /// Displayed when the application starts.
    case welcome
    /// Displayed when prompted to enter a command.
    case enterCommand
    /// Displayed when prompted to enter the name of the item to add.
    case addItem
    /// Displayed when prompted to enter the name of the item to remove.
    case removeItemByName
    /// Displayed when prompted to enter the number of the item to remove.
    case removeItemByNumber
    /// Displayed when the application exits.
    case goodbye

    var message: String {
        switch self {
        case .welcome:
            return "Welcome to ShoppingList application!"
        case .enterCommand:
            return "Enter command:"
        case .addItem:
            return "Enter the name of item to add:"
        case .removeItemByName:
            return "Enter the name of the item to remove:"
        case .removeItemByNumber:
            return "Enter the number of the item to remove:"
        case .goodbye:
            return "Goodbye!"
        }
    }
}
