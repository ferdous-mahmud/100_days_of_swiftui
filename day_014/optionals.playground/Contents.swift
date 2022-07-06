import Foundation

let oposits = ["Mario": "Warrio", "Luagi": "Waluagi"]
if let peachOposit = oposits["peach"] {
    print(peachOposit)
} else {
    print("No value present on peachOposit!")
}

var number: Int? = nil

// Shadowing optionals
if let number = number {
    print(number)
} else {
    print("Number is nil!")
}

