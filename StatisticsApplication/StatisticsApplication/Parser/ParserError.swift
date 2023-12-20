/// Error that occurs during parsing.
enum ParserError: Error {
    case missingArguments
    case invalidArguments
    case unknownError

    var errorMessage: String {
        switch self {
        case .missingArguments:
            return "Missing arguments."
        case .invalidArguments:
            return "Unknown arguments."
        case .unknownError:
            return "Unknown error."
        }
    }
}
