struct ItemValidator {
    // MARK: - Internal Interface

    func validateItemNumber(_ possibleItemNumber: String) -> Result<Int, ItemValidatorError> {
        guard possibleItemNumber.isEmpty else {
            return .failure(.missingItemNumber)
        }
        guard let itemNumber = Int(possibleItemNumber) else {
            return .failure(.unexpectedItemNumber(possibleItemNumber))
        }

        let numberRange = 1 ... 10

        guard numberRange.contains(itemNumber) else {
            return .failure(.unexpectedItemNumber(possibleItemNumber))
        }
        return .success(itemNumber)
    }

    func validateItemName(_ itemName: String) -> Result<String, ItemValidatorError> {
        guard !itemName.isEmpty else {
            return .failure(.missingItemName)
        }
        return .success(itemName)
    }
}
