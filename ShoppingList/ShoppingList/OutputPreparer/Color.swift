/// Represents the color of the output messages.
enum Color {
    /// Default text color.
    static let silence = "\u{001B}[;m"
    /// Red text color.
    static let red = "\u{001B}[0;31m"
    /// Green text color.
    static let green = "\u{001B}[32m"
}
