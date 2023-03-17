struct ConsoleIO {
    
    func write(_ items: Any...) {
        items.forEach { Swift.print($0, terminator: "") }
    }
    
    func writeLine(_ items: Any...) {
        items.forEach { Swift.print($0, terminator: "") }
        Swift.print()
    }
}
