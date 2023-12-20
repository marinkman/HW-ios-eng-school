/// Contains error in reading input data.
enum ConsoleIOError: Error {
    /// Failure to read the line.
    case failureToReadInput

    var errorMessage: String {
        switch self {
        case .failureToReadInput:
            return "Failed to read line."
        }
    }
}
