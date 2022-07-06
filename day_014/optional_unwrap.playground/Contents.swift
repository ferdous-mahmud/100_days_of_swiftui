import Foundation

var name: String? = nil

// unwrap using if let
if let name = name {
    // run when variable have a value
    print(name)
}

// unwrap using guard let
func printSquare(number: Int?) {
    guard let number = number else {
        // run when variable don't have a value
        print("Invalid! Please input a valid number.")
        return
    }

    print("The squre of \(number) = \(number * number)")
}

var number: Int? = nil
printSquare(number: number)

number = 5
printSquare(number: number)
