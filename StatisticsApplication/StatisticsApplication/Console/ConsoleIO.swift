import Foundation

/// Concole input and output
struct ConsoleIO {
    /**
     Prints a message to the concole.

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
}
