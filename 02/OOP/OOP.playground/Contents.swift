//: Playground - noun: a place where people can play

class Greeter {

    let name: String?

    init(with name: String?) {
        self.name = name
    }

    func greet() {
        print("Hello, \(name!)")
    }
}

let g = Greeter(with: "Puny human")
g.greet()

/// теперь про наследование

class RussianGreeter: Greeter {

    override func greet() {
        print("Привет, \(name!)")
    }
}

let rg: Greeter = RussianGreeter(with: "Иннокентий")
rg.greet()
rg.name

//
//
//// Теперь поговорим про то, что такое протокол
//
// Для начала создадим себе проблему

protocol GreetingProducer {
    func makeGreeting() -> String;
}

extension GreetingProducer {
    func makeGreeting() -> String {
        return "extension"
    }
}

class GreetingMaker: GreetingProducer {

    private let name: String

    init(with name: String) {
        self.name = name
    }

    func makeGreeting() -> String {
        return "Hello, \(name)"
    }
}

class GreetingPrinter {
    private let maker: GreetingProducer

    init(with maker: GreetingProducer) {
        self.maker = maker
    }

    func doIt() {
        print(maker.makeGreeting())
    }
}

let gp = GreetingPrinter(with: GreetingMaker(with: "you"))
gp.doIt()

// теперь сделаем класс, который реализует что-то другое, например данные по человеку

class PersonInfo: GreetingProducer {
    let firstName: String
    let lastName: String
    let address: String
    let age: Int

    init(firstName: String, lastName: String, address: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.age = age
    }

    func makeGreeting() -> String {
        return "Hello \(firstName) \(lastName)"
    }
}

let gpp = GreetingPrinter(with: PersonInfo(firstName: "1", lastName: "2", address: "3", age: 4))
gpp.doIt()

var test: String? = "test"
print(test)

test?.count

let testGreeter: Greeter? = Greeter(with: "nil")

if let c = testGreeter?.name?.count {
    print(c)
} else {
    print("there is nil")

    throw "" as! Error
}

extension String {
    func greeting() -> String {
        return "Hello \(self)"
    }
}

let myName = "test"
myName.greeting()


class A : GreetingProducer {

}

let a = A()
a.makeGreeting()


