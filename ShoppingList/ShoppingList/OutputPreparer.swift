/// Prepares messages for output to the concole.
class OutputPreparer {
    // MARK: - Internal Interface

    /**
     Initializes an `OutputPreparer` with a `ConsoleIO` object.
     - Parameter console: The `ConsoleIO` object to use for console input and output.
     */
    init(console: ConsoleIOWrapper) {
        self.console = console
    }

    /**
     Shows a `Result` object that contains a success message or an error message.
     - Parameter result: The `Result` object to show.
     */
    func showResult(_ result: Result<String, Error>) {
        switch result {
        case let .success(message):
            showSuccess(message)
        case let .failure(error):
            showError(error)
        }
    }

    /**
     Shows a message to the console.
     - Parameter message: The message to show.
     */
    func show(_ message: Any) {
        let silence = Color.silence
        console.write("\(silence)\(message)")
    }

    /**
     Shows a line with a message to the console.
     - Parameter message: The message to show.
     */
    func showLine(_ message: Any) {
        let silence = Color.silence
        console.writeLine("\(silence)\(message)")
    }

    /**
     Shows a success message to the console.
     - Parameter message: The message to show.
     */
    func showSuccess(_ message: Any) {
        let green = Color.green
        console.writeLine("\(green)\(message)")
    }

    /**
     Shows the localized description of the error to the console.
     - Parameter error: The error to show.
     */
    func showError(_ error: Error) {
        let red = Color.red
        console.writeErrorLine("\(red)\(error.localizedDescription)")
    }

    // MARK: - Private interface

    private let console: ConsoleIOWrapper
}
