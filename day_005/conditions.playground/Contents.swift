import Foundation

let score = 85
let age = 18

// Simgle Condition
if score > 80 {
    print("Great Job!")
}

if age >= 18 {
    print("Your are eligible for vote")
}

let myName = "Ferdous"
let friendName = "Akash"

if friendName < myName {
    print(friendName)
} else {
    print(myName)
}

var userName = "tailorswift"
//userName = ""

if userName.isEmpty {
    userName = "Annonymus"
}
print("Welcome \(userName)")



// Multiple condition
let userAge = 17
let hasParentPermission = true


if userAge >= 18 || hasParentPermission {
    print("You can buy the game")
}

enum TransportOption {
    case airplane, bicycle, car, escooter, train, helecopter
}

let tranport = TransportOption.car

if tranport == .airplane || tranport == .helecopter {
    print("lets fly!")
} else if tranport == .car {
    print("You may cought by traffic")
} else if tranport == .bicycle {
    print("You have to mussel power")
} else {
    print("escooter riding may be dengerous")
}


// Switch case
// Always chack all possible cases
enum WeatherForcast {
    case
    sunny,
    cloudy,
    rainny,
    thunderry,
    foggy
}

let weather = WeatherForcast.rainny

switch weather {
case .sunny:
    print("We are ready to go")
case .cloudy:
    print("Put umbrela on your bag")
case .rainny:
    print("Don't go outside")
case .thunderry:
    print("Stay at home")
case .foggy:
    print("Ware warm cloths")
}

let capital = "Dellhi"

switch capital {
case "Dhaka":
    print("BANGLADESH")
case "Dellhi":
    fallthrough // fallthrough jump to next case
case "New Dellhi":
    print("India")
case "Korachi":
    print("Pakisthan")
default:
    print("No country matches")
}


// Ternary conditional operators
// bool ? if true execute : if false execute
let canVote = false
print(canVote ? "You can vote now" : "You are kid")

enum Theme {
    case light, dark
}

let theme = Theme.dark
let backgroundColor = (theme == Theme.dark) ? "Black" : "White"
print(backgroundColor)





