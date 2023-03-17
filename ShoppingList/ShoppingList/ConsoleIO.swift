struct ConsoleIO {
    
    func write(_ items: Any...) {
        items.forEach { Swift.print($0, terminator: "") }
    }
}
