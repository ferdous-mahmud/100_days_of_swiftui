import Foundation

// Opaque return types
// We can change our mind letter and return anything equitable
// Swift dosen't complain returnning opaque return type

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...100)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())
//print(getRandomNumber() == getRandomBool())
