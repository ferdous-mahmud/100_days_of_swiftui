// Swift fundamental pracitce
import Foundation

// Constanse - Never change
let number = 10

// Variable - Can change
var num = 20
num = 30


// Multi number string
let multilineSt = """
This is
Multi line string
swift on swift
"""

print(multilineSt.count)

let score = 10
let higherScore = score + 10 * 20

let intNum = 10
let doubleNum = 10.0

// String interpultaion
print("High Score = \(higherScore)")

// Array
var arr = [Int]() // Int array
var colors = ["Red", "Green", "Blue"]
print(colors[0])
colors.append("Yellow")


// Dictonary
// Key value pair
let employee = [
    "Name": "Tailor",
    "Job Title": "iOS Engineer",
    "Age": "20"
]
print(employee["Name"] ?? "Annonymus")

// Sets
// Uniqe element of array
var numbers = Set([10, 20, 30, 40, 50])
numbers.insert(90) // O(1)

// emums
// Colleciton of static items
enum Weekday {
    case Saturday, Sunday, Monday, Tuesday, Wednesday, Thursday, Friday
}
print(Weekday.Sunday)

enum theme {
    case dark, light, system
}
print("Current theme is : \(theme.dark)")



// Conditional statement
let age = 14
if age >= 18 {
    print("You can vote")
} else {
    print("You can't vote")
}

// Turnary operators
let canVote = age >= 18 ? "Yes" : "No"
print(canVote)


// Array with for loops
let platforms = ["iOS", "tvOS", "MacOS", "iPodOS"]

for platform in platforms {
    print(platform)
}

// Function
func addTwoNumber (num1: Int, num2: Int) -> Int {
    num1 + num2
}
print(addTwoNumber(num1: 10, num2: 20))

func roleDice() -> Int {
    Int.random(in: 1...6)
}
print(roleDice())

func printTimeTables (for num: Int = 10) {
    for i in 1...12 {
        print("\(i) * \(num) = \(i * num)")
    }
}
printTimeTables(for: 5)
printTimeTables() // assign value by default 10


// Func with error
enum PasswordError: Error {
    case shrot, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.shrot
    }
    
    if password == "12345678" {
        throw PasswordError.obvious
    }
    
    if password.count < 10 {
        return "OK"
    } else {
        return "Good"
    }
}

// error checking
do {
    let result = try checkPassword("12345678")
    print(result)
} catch {
    print("Error: \(error)")
}


// Clouser
let sayHello = { (name: String) -> String in
    "Hello \(name)!"
}
print(sayHello("Ferdous"))

// Struct
// Make your own data type
struct Album {
    let artist: String
    let title: String
    var isReleased = false
}

let red = Album(artist: "Red Wind", title: "This is title for red")
print(red.isReleased)


// Propertie observer
struct Game {
    var score = 0 {
        // call when get initialized
        willSet {
            print("Score will seted \(score)")
        }
        // call when value change
        didSet {
            print("Score is now \(score)")
        }
    }
}

var cricket = Game(score: 300)
cricket.score = 250


// Access modifier
struct BankAccount {
    private (set) var fund = 0
    
    mutating func deposit(ammount: Int) {
        fund += ammount
    }
    
    mutating func withdraw(ammount: Int) -> Bool {
        if fund >= ammount {
            fund -= ammount
            return true
        } else {
            return false
        }
    }
}

var mybankAccount = BankAccount()
mybankAccount.deposit(ammount: 10_000_000)
mybankAccount.withdraw(ammount: 5_000)
print(mybankAccount.fund)


// Class
// Parent class
class Employee {
    let hours: Int
    
    init(hours: Int){
        self.hours = hours
    }
    
    func printSummary(){
        print("I work \(hours) hours a day.")
    }
}

// Child class inharite from parent
class Developer: Employee {
    func work() {
        print("I am coding for \(hours) hours a day.")
    }
    
    override func printSummary() {
        print("I work as a developer\(hours) hours a day.")
    }
}

let nodi = Developer(hours: 8)
nodi.work()


// Protocol
protocol Vechicle {
    func estimateTime( for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vechicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 20
    }
    
    func travel(distance: Int) {
        print("I am traveling \(distance)km distance by car")
    }
}

func commute(distance: Int, using vehicle: Vechicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("It's too slow")
    } else {
        vehicle.travel(distance: distance)
    }
}
let car = Car()
commute(distance: 250, using: car)


// Extension
// Add new functionality on existing type
extension String {
    func trimed() -> String {
        self.trimmingCharacters(in: .whitespaces)
    }
}

var quote = "   this is a quote wiht whitespace "
quote =  quote.trimed()
