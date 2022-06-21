import Foundation

// Dictonaries
// Key value pair
var booksPrice = [
    "Gitanjoli": 12.00,
    "SesherKobita": 5.66,
    "ThakurmarJhuli": 4.00,
    "Boymkesh": 10.50
]

print(booksPrice["Boymkesh"]!)

var capitals = [
    "Bangladesh": "Dhaka",
    "India": "New Dellhi",
    "Nepal": "Kathmandu",
    "France": "Paric",
    "US": "Washington DC",
    "UK": "London"
]

print(capitals["Pakisthan", default: "Unknown"]) // default value


// Set
// Unique element of array but unordered
// No repeted value
// Optimize for fast lookup
var actors = Set([
    "Danial Defo",
    "Arther Conoldoyel",
    "Tom Crose",
    "Tom Hanks",
    "Jhon doe"
])

actors.insert("Samual L Jackson")

print(actors)



// Enums
// Set of named values
enum days {
    case
        sunday,
        monday,
        tuesday,
        wednesday,
        thursday,
        friday
}

print(days.monday)
