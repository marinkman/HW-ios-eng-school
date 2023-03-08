/// Contains error in reading input data
enum ErrorInReadingInput: Error {
    /// Failure to read the line
    case failure

    var errorMessage: String {
        switch self {
        case .failure:
            return "Failed to read line"
        }
    }
}
