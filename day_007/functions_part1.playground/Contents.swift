import Foundation

// Funcitons on swift
func showWelcome () {
    print("Welcome!")
}


func multiply (_ num1: Int, _ num2: Int) -> Int {
    return num1 * num2
}

func getDayName (order: Int) -> String {
    switch order {
    case 1:
        return "Saturday"
    case 2:
        return "Sunday"
    case 3:
        return "Monday"
    case 4:
        return "Tuesdey"
    case 5:
        return "Wednesday"
    case 6:
        return "Thursday"
    case 7:
        return "Friday"
    default:
        return "Error! Please input order 1...7"
    }
}

func isContainSameLetters (_ string1: String, _ string2: String) -> Bool {
    
    if string1.count != string2.count {
        return false
    }
    
    return string1.sorted() == string2.sorted()
}


func pythagoras (a: Double, b: Double) -> Double {
    sqrt(a * a + b * b) // One line func don't need return
}


// Return multiple items from a funciton
func getUser1() -> [String] {
    return [
        "Tailor",
        "Swift",
        "Ed",
        "Sheren"
    ]
}

// Return Tuples   // array of tuples
func getUser2() -> [(firstName: String, lastName: String)] {
    return [
        (firstName: "Ferdous", lastName: "Akash"),
        ("Tailor","Swift") // return without spacifing their names
    ]
}

// destructuring tuples
func getUser3() -> (firstName: String, lastName: String) {
        (firstName: "Ferdous", lastName: "Akash")
}

let (firstName, lastName) = getUser3()
print(firstName, lastName)


pythagoras(a: 3, b: 4)
isContainSameLetters("aab", "baa")
isContainSameLetters("abcd", "aabd")
showWelcome()
multiply(5, 5)
getDayName(order: 7)
getUser1()
getUser2()
