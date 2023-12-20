/// Contains information about the operation of the application.
enum Help {
    static let message = """

    StatisticsApplication is an application that calculates statistics.
    Supports two modes: static mode and interactive mode.
    Static mode: works with arguments entered on the command line.
    Interactive mode: works with arguments passed from a file.

    COMMANDS:
               --median
                   calculates the element that is in the middle of the sorted sequence;
                   if there are two such elements, then calculates the arithmetic mean of them

               --mean
                   calculates the arithmetic mean of the given numbers

               --mode
                   calculates the most frequently occurring element from the given numbers

               --help
                   shows usage information

    USAGE:
               ./StatisticsApplication [command] [numbers]
                    calculates the specified statistics of the specified numbers
                ./StatisticsApplication [numbers]
                    calculates all possible statistics
               cat [file name] | ./StatisticsApplication
                    calculates the specified statistics of the specified numbers which are in the file

    EXAMPLE:
               ./StatisticsApplication --median 1 12 5 6
               ./StatisticsApplication 3 5 10
               cat file.txt | ./StatisticsApplication

    """
}
