/// Represents the application.
class Application {
    // MARK: - Internal interface

    /**
     Initializes a new instance of the `Application` class.
     - Parameters:
        - outputPreparer: The preparer messages for output to the console.
        - console: The I/O wrapper to use for console input and output.
        - runLoop: The run cycle to use in the application.
        - commandValidator: The validator of the command entered by user.
        - itemValidator: The validator of the item entered by user.
        - mediator: The mediator between the user interface and the `ShoppingList` object.
     */
    init(_ outputPreparer: OutputPreparer,
         _ console: ConsoleIOWrapper,
         _ runLoop: RunLoop,
         _ commandValidator: CommandValidator,
         _ itemValidator: ItemValidator,
         _ mediator: Mediator)
    {
        self.outputPreparer = outputPreparer
        self.console = console
        self.runLoop = runLoop
        self.commandValidator = commandValidator
        self.itemValidator = itemValidator
        self.mediator = mediator
    }

    /// Starts the application.
    func run() {
        outputPreparer.showLine(ApplicationPrompt.welcome.message)
        outputPreparer.showLine(Help.message)
        runLoop.start()

        repeat {
            outputPreparer.show(ApplicationPrompt.enterCommand.message)

            let possibleCommand = console.readLine()
            let validationResult = commandValidator.validate(possibleCommand)

            switch validationResult {
            case let .success(command):
                handle(command)
            case let .failure(error):
                outputPreparer.showError(error)
            }

        } while !runLoop.shouldStop

        outputPreparer.showLine(ApplicationPrompt.goodbye.message)
    }

    // MARK: - Private interface

    private let outputPreparer: OutputPreparer
    private let console: ConsoleIOWrapper
    private let runLoop: RunLoop
    private let commandValidator: CommandValidator
    private let itemValidator: ItemValidator
    private let mediator: Mediator

    private func handle(_ command: Command) {
        switch command {
        case .add:
            performAdding()
        case .remove:
            performRemovingByName()
        case .removeAt:
            performRemovingByNumber()
        case .show:
            performShowing()
        case .help:
            outputPreparer.showLine(Help.message)
        case .exit:
            runLoop.stop()
        }
    }

    private func performAdding() {
        outputPreparer.show(ApplicationPrompt.addItem.message)

        let possibleItemName = console.readLine()
        let itemValidationResult = itemValidator.validateItemName(possibleItemName)

        switch itemValidationResult {
        case let .success(itemName):
            let additionResult = mediator.perform(.add(itemName: itemName))
            outputPreparer.showResult(additionResult)
        case let .failure(error):
            outputPreparer.showError(error)
        }
    }

    private func performRemovingByName() {
        outputPreparer.show(ApplicationPrompt.removeItemByName.message)

        let possibleItemName = console.readLine()
        let itemValidationResult = itemValidator.validateItemName(possibleItemName)

        switch itemValidationResult {
        case let .success(itemName):
            let removalResult = mediator.perform(.remove(itemName: itemName))
            outputPreparer.showResult(removalResult)
        case let .failure(error):
            outputPreparer.showError(error)
        }
    }

    private func performRemovingByNumber() {
        outputPreparer.show(ApplicationPrompt.removeItemByNumber.message)

        let possibleItemNumber = console.readLine()
        let itemValidationResult = itemValidator.validateItemNumber(possibleItemNumber)

        switch itemValidationResult {
        case let .success(itemNumber):
            let removalResult = mediator.perform(.removeAt(itemNumber: itemNumber))
            outputPreparer.showResult(removalResult)
        case let .failure(error):
            outputPreparer.showError(error)
        }
    }

    private func performShowing() {
        let performanceResult = mediator.perform(.show)

        switch performanceResult {
        case let .success(listContent):
            outputPreparer.showLine(listContent)
        case let .failure(error):
            outputPreparer.showError(error)
        }
    }
}
