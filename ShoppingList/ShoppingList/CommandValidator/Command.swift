/// Represents the commands available to the user.
/// Each command has a shortcut key that can be typed instead of the command name.
enum Command: String {
    /// Adds an item from the list.
    case add = "a"
    /// Removes an item from the list by name.
    case remove = "r"
    /// Removes an item from the list by index.
    case removeAt = "ra"
    /// Displays a list of items.
    case show = "s"
    /// Displays a help message.
    case help = "h"
    /// Exits the application.
    case exit = "e"
}
