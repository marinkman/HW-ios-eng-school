/// Represents the actions available to the user.
/// Each command has a shortcut key that can be typed instead of the command name.
enum Command: String {
    /// Removes an item from the list.
    case add = "a"
    /// Adds an item to the list.
    case remove = "r"
    /// Displays a list of items.
    case show = "s"
    /// Displays a help message.
    case help = "h"
    /// Exits the application.
    case exit = "e"
}
