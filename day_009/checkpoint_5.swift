// Checkpoint - 5 

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// Filter out the numbers that are even
let evenNumber = {(numbers: [Int]) -> [Int] in 
    var result = [Int]()

    for num in numbers {
        if num % 2 == 0 {
            result.append(num)
        }
    }

    return result
}
print(evenNumber(luckyNumbers))

// sort the array in ascending order
let ascendingSortedLuckyNumber = luckyNumbers.sorted()
print(ascendingSortedLuckyNumber)

// Map them to strings in the format "7 is a lucky number"
let stringedLuckyNumber = {(numbars: [Int]) -> [String] in
    var result = [String]()
    
    for number in numbars {
        result.append("\(number) is a lucky number")
    }

    return result
}

print(stringedLuckyNumber(luckyNumbers))