/// Validates a shopping list item entered by user.
struct ItemValidator {
    // MARK: - Internal Interface

    /**
     Converts if the input string is a valid item number.
     - Parameter input: The string to check.
     - Returns: `Result` representing the success or failure of the validation.
     In case of success the `Result` contains the item number as an `Int`,
     otherwise it contains `Error`.
     */
    func validateItemNumber(_ input: String) -> Result<Int, Error> {
        guard !input.isEmpty else {
            return .failure(ItemValidatorError.missingItemNumber)
        }
        guard let number = Int(input) else {
            return .failure(ItemValidatorError.notAnInteger(input))
        }

        let validRangeOfNumbers = 1...10

        guard validRangeOfNumbers.contains(number) else {
            return .failure(ItemValidatorError.outOfRange(input))
        }
        return .success(number)
    }

    /**
     Checks if the input string is a valid item name.
     - Parameter itemName: The string to check.
     - Returns: `Result` representing the success or failure of the validation.
     In case of success the `Result` contains the item name as a `String`,
     otherwise it contains `Error`.
     */
    func validateItemName(_ itemName: String) -> Result<String, Error> {
        guard !itemName.isEmpty else {
            return .failure(ItemValidatorError.missingItemName)
        }
        return .success(itemName)
    }
}
