enum ErrorInReadingInput: Error {
    case failure

    var errorMessage: String {
        switch self {
        case .failure:
            return "Failed to read line"
        }
    }
}
