import func Darwin.fputs
import var Darwin.stderr

/// Handles the console input and output.
struct ConsoleIO: ConsoleIOWrapper {
    /**
     Reads a string from standard input through the end of the current line or until EOF is reached.

     - Returns: The string of characters read from standard input.
     If EOF has already been reached when readLine() is called, the result is an empty string.
     */
    func readLine() -> String {
        Swift.readLine() ?? ""
    }

    /**
     Writes the textual representations of the given items into the standard output.

     - Parameters:
        - items: Zero or more items to write.
        - separator: A string to write between each item. The default is a single space (" ").
        - terminator: The string to write after all items have been written. The default is a newline ("\n").
     */
    func write(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        Swift.print(items, separator: separator, terminator: terminator)
    }

    /**
     Writes the error message into error output.
     The newline ("\n") will be written after the message.

     - Parameter errorMessage: Error message to write.
     */
    func writeErrorLine(_ errorMessage: String) {
        fputs("\(errorMessage)\n", stderr)
    }
}
