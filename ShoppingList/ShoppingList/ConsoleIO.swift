import func Darwin.fputs
import var Darwin.stderr

/// Handles the console input and output.
struct ConsoleIO {
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
        - items: Zero or more items to print.
        - itemsSeparator: A string to print between each item. The default is a single space (" ").
        - itemsTerminator: The string to write after all items have been written. The default is a newline ("\n").
     */
    func write(_ items: Any..., itemsSeparator: String = " ", itemsTerminator: String = "\n") {
        Swift.print(items, separator: itemsSeparator, terminator: itemsTerminator)
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
