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
     The newline ("\n") will be written after each item.

     - Parameters:
        - items: Zero or more items to write.
     */
    func writeLine(_ items: Any...) {
        items.forEach { Swift.print($0, terminator: "\n") }
    }

    /**
     Writes the textual representations of the given items into the standard output.
     The single space (" ") will be written after each item.

     - Parameters:
        - items: Zero or more items to write.
     */
    func write(_ items: Any...) {
        items.forEach { Swift.print($0, terminator: " ") }
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
