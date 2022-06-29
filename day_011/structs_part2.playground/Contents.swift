import Foundation

// struct access control
struct BankAccount {
    private var fund = 0 // resticted only inside this struct
//    fileprivate var fund = 0 // resticted only inside this file
//    private(set) var fund = 0 // Only get data but dont change outside this structs function
//    public var fund = 0 // accessible for anyone
    
    mutating func deposit (ammount: Int) {
        fund += ammount
    }
    
    mutating func withdraw (ammount: Int) -> Bool {
        if fund >= ammount {
            fund -= ammount
            return true
        }
        return false
    }
}

var mybankAccount = BankAccount ()
mybankAccount.deposit(ammount: 10_000)

if mybankAccount.withdraw(ammount: 20_000) {
    print("Withdraw successful")
} else {
    print("Sorry! you don't have sufficient balance to withdraw")
}

// Static properties and methods on a stack

struct School {
    static var studentCount = 0
    
    static func addStudent (student: String) {
        print("\(student) just joined to the school!")
        studentCount += 1
    }
}

School.addStudent(student: "Devid Miller")



// self ->      Current value of a struct
// Self ->      Current type of a stack


struct AppData {
    static let version = "1.0.2 beta 2"
    static let savedFileName = "settings.json"
    static let homeURL = "https://ferdous-mahmud.me"
}

print(AppData.version)
