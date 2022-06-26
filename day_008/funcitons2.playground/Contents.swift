import Foundation

// Defautl parameter value in a fucntion

func printTimeTable (for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(number) x \(i) = \(number * i)")
    }
}

// Handle error in a funciton
enum passwordError: Error {
    case short, obious
}

func checkPassword (_ password: String) throws -> String {
    if password.count < 5 {
        throw passwordError.short
    }
    
    if password == "12345" {
        throw passwordError.obious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "GOOD"
    } else {
        return "EXCELLENT"
    }
}

do {
    let result = try checkPassword("12345432")
    print(result)
} catch passwordError.obious {
    print("Your password is so generic!")
}
catch {
    print("Find error when checking password! error: \(error)")
}

printTimeTable(for: 5, end: 10)
