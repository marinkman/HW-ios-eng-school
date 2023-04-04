/// Represents a wrapper for standart input and output streams: stdin, stdout, stderr.
protocol ConsoleIOWrapper {
    /**
     Reads a string from standard input through the end of the current line or until EOF is reached.

     - Returns: The string of characters read from standard input.
     */
    func readLine() -> String

    /**
     Writes the textual representations of the each given items on a new line into stdout.

     - Parameters:
        - items: Zero or more items to write.
     */
    func writeLine(_ items: Any...)

    /**
     Writes the textual representations of the given items into stdout.

     - Parameters:
        - items: Zero or more items to write.
     */
    func write(_ items: Any...)

    /**
     Writes the error message, followed by the current line terminator, into stderr.

     - Parameter errorMessage: Error message to write.
     */
    func writeErrorLine(_ errorMessage: String)
}
