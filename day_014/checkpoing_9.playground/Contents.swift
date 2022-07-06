import Foundation

//  Checkpoint 9
//  Write a function that accepts an optional array of integers, and returns
//     * one of those integers randomly.
//     * If the array is missing or empty, return a new random number in the range 1 through 100.
//  Write your function in a single line of code.

func returnRandomElement(array: [Int]?) -> Int {
    array?.randomElement() ?? Int.random(in: 1...100)
}

print(returnRandomElement(array: [100, 200, 300, 400]))
print(returnRandomElement(array: nil))
