import Foundation

// Where class is different form struct
// - Inheritance
// - Need custor initializer
// - Copy of same class reference same data
// - We can use deinitializer
// - Constant class can change their variable properties

class Game {
    var score = 0 {
        didSet {
            print("New score = \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10


// Inheritance
// Child class get all properties and methods from parent class

class Employee {
    let hours: Int
    
    init (hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I am working \(hours) hours a day")
    }
}

class Developer: Employee { // Sublclass of Employee
    func work() {
        print("I am writting code for \(hours) hours")
    }
    
    override func printSummary() {
        // Overrriding parent classes function
        print("I am working as a dev for \(hours) hours a day")
    }
}

final class Manager: Employee {  // No child class can inherite form manager class because of final
    func work() {
        print("I am meeting for \(hours) hours")
    }
}

let dev1 = Developer(hours: 8)
let manager1 = Manager(hours: 10)
dev1.work()
manager1.work()

let dev2 = Developer(hours: 6)
dev2.printSummary()
manager1.printSummary()

// Class initializer
class Vehicle {
    let isElectric: Bool
    
    init (isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isCovertable: Bool
    
    init (isElectric: Bool, isCovertable: Bool) {
        self.isCovertable = isCovertable
        super.init(isElectric: isElectric) // initializing super class
    }
}

let tesla = Car(isElectric: true, isCovertable: false)



// Copy class
// Reference type copy
// All instance of the class refer same data

class User {
    var userName = "Anonymus"
    
    // Copy constructor create unique copy of the class
    func copy() -> User {
        let user = User()
        user.userName = userName
        return user
    }
}

var user1 = User()
var user2 = user1.copy()
user1.userName = "Ferdous"
user2.userName = "Akash"

print(user1.userName)
print(user2.userName)

// Deinitializer
// Never take data or return data
// Automaticly call
// We never call deinitializer directly

class ColdDrink {
    var sugerQuantity: Int
    
    init(sugerQunatity: Int) {
        self.sugerQuantity = sugerQunatity
        print("CodeDrink class created with suger quantity \(sugerQuantity)")
    }
    
    deinit {
        print("ColdDrink Class destroyed with suger quantity \(sugerQuantity)")
    }
}

for i in 0...5 {
    let drink = ColdDrink(sugerQunatity: i)
    print(drink.sugerQuantity)
}



    
