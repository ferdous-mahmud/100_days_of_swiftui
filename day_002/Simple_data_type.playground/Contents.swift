import Foundation

// Arrays
// Continious collection of same data types of data
var arr = [Int]()

arr.insert(10, at: 0)
arr.append(20)
arr.append(30)

arr.removeLast()
arr.removeFirst()

print(arr[0])

arr.append(contentsOf: [40, 50, 60,
                       70])
arr += [80, 90, 100]


// Set
// Sets are unique unordered collection of same type of element
// No item comes up twise
var color = Set(["White", "Red", "Green"])

// Same item ignored multiple times
var color2 = Set(["white", "red", "green", "green", "red"])




// Tuples
// Store savaral values together using single value
var userInfo = (
    firstName: "Ferdous",
    lastName: "Akash",
    username: "ferdous",
    email: "ferdous.webdev@gmail.com",
    password: "*****"
)

print(userInfo.0) // access by index
print(userInfo.password) // access by name
userInfo.username = "ferdous19" // change value









