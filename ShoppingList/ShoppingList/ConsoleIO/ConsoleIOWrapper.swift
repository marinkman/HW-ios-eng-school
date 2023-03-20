/// Represents a wrapper for standart input and output streams: stdin, stdout, stderr.
protocol ConsoleIOWrapper {
    /**
     Reads a string from standard input through the end of the current line or until EOF is reached.

     - Returns: The string of characters read from standard input.
     */
    func readLine() -> String

    /**
     Writes the textual representations of the given items into the standard output.

     - Parameters:
        - items: Zero or more items to write.
        - separator: A string to write between each item.
        - terminator: The string to write after all items have been written.
     */
    func write(_ items: Any..., separator: String, terminator: String)

    /**
     Writes the error message, followed by the current line terminator, into stderr.

     - Parameter errorMessage: Error message to write.
     */
    func writeErrorLine(_ errorMessage: String)
}
