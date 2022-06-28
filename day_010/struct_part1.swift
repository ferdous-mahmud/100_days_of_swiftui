// Struct

struct Album { // Struct name starts with capital letter
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) \(artist) \(year)")
    }
}

let red = Album(title: "Red", artist: "Tailor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

red.printSummary()
wings.printSummary()

struct Employee {
    let name: String
    var vacationRemaining = 14

    // Must use mutating keyword when methods change any properties
    mutating func takeVacation(days: Int) {
        if vacationRemaining >= days {
            vacationRemaining -= days
            print("I am going to vacation for \(days) days")
        } else {
            print("Sorry, There is no vacation remaining!")
        }
    }
}

var eric = Employee(name: "Eric", vacationRemaining: 10)
let kevin = Employee(name: "Kevin paul") // different type of initialization
eric.takeVacation(days: 5)
eric.takeVacation(days: 7)

print(kevin.vacationRemaining)