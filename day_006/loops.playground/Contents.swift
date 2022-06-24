import Foundation

// For loop
let platform = ["MacOS", "TvOS", "iOS", "WatchOS"]

for os in platform {
    print(os)
}

for i in 1...10 {
    print("5 * \(i) = \(5 * i)")
}

let count = 1...3

for _ in count {
    print("Hello World")
}


// While Loop
var coundown = 10

while coundown != 0 {
    print(coundown)
    coundown -= 1
}

// Random variable
var id = Int.random(in: 1...10000)
var ammount = Double.random(in: 0...1)
print(id, ammount)


var diceRoll = 1

while diceRoll != 6 {
    diceRoll = Int.random(in: 1...6)
    print(diceRoll)
}

// Continue and Break

for i in 1...5 {
    if i == 3 {
        continue
    }
    print(i)
    if i == 4 {
        break
    }
}

var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)

