/// Represents a validator of the item entered by user.
struct ItemValidator {
    // MARK: - Internal Interface

    /**
     Checks if the input string is a valid item number.
     - Parameter possibleNumber: The string to check.
     - Returns: `Result` representing the success or failure of the validation.
     In case of success the `Result` contains the item number as an `Int`,
     otherwise it contains `ItemValidatorError`.
     */
    func validateItemNumber(_ possibleItemNumber: String) -> Result<Int, ItemValidatorError> {
        guard !possibleItemNumber.isEmpty else {
            return .failure(.missingItemNumber)
        }
        guard let itemNumber = Int(possibleItemNumber) else {
            return .failure(.notAnInteger(possibleItemNumber))
        }

        let numberRange = 1...10

        guard numberRange.contains(itemNumber) else {
            return .failure(.outOfRange(possibleItemNumber))
        }
        return .success(itemNumber)
    }

    /**
     Checks if the input string is a valid item name.
     - Parameter itemName: The string to check.
     - Returns: `Result` representing the success or failure of the validation.
     In case of success the `Result` contains the item name as a `String`,
     otherwise it contains `ItemValidatorError`.
     */
    func validateItemName(_ itemName: String) -> Result<String, ItemValidatorError> {
        guard !itemName.isEmpty else {
            return .failure(.missingItemName)
        }
        return .success(itemName)
    }
}
