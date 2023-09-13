let console = ConsoleIO()
let shoppingList = InMemoryShoppingList()
let app = Application(OutputPreparer(console: console),
                      console,
                      RunLoop(),
                      CommandValidator(),
                      ItemValidator(),
                      Mediator(shoppingList: shoppingList))
app.run()
