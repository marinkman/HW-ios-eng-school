/// Represents the application's run cycle.
class RunLoop {
    // MARK: - Internal interface

    /// Indicates whether the loop should stop.
    private(set) var shouldStop = true

    /// Starts the run loop.
    func start() {
        shouldStop = false
    }

    /// Stops the run loop.
    func stop() {
        shouldStop = true
    }
}
