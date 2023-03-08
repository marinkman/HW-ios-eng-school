import Foundation

/// Concole input and output
struct ConsoleIO {
    /**
     Writes a message to the console.

     - Parameters:
        - message: String to output to console.
        - output: Type of data output to the console. The default is standard output.

     */
    static func writeMessage(_ message: String, to output: OutputType = .standard) {
        switch output {
        case .standard:
            print("\(message)")
        case .error:
            fputs("Error: \(message)\n", stderr)
        }
    }

    /**
     Reads a string and converts it to an array of strings.

     - Complexity: `O(N)`, where `N` is the length of the readable line.

     - Returns: An array of strings.

     */
    static func readInput() throws -> [String] {
        guard let inputString = readLine() else { throw ErrorInReadingInput.failure }

        let result = inputString.split(separator: " ").map { String($0) }

        return result
    }
}
