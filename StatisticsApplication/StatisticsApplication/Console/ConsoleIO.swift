import Foundation

/// Concole input and output
struct ConsoleIO {
    /**
     Writes a message to the console.

     - Parameters:
        - message: String to output to console.
        - type: Type of data output to the console. The default is standard output.

     */
    static func writeMessage(_ message: String, _ type: OutputType = .standard) {
        switch type {
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
    static func readInput() -> [String] {
        guard let inputString = readLine() else { return [] }

        let result = inputString.split(separator: " ").map { String($0) }

        return result
    }
}
