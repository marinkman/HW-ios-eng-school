/// Сontains modes available in the application.
enum Mode {
    ///  Mode in which data is entered by user through the command line.
    case staticMode
    /// Mode in which data is transferred from a file.
    case interactiveMode

    /**
     Sets the mode.

     - Parameters:
        - numberOfArguments: Number of arguments.
     - Returns: The mode in which the application will run.

     */
    static func setTheMode(_ numberOfArguments: Int32) -> Mode {
        if numberOfArguments < 2 {
            return Mode.interactiveMode
        } else { return Mode.staticMode }
    }
}
