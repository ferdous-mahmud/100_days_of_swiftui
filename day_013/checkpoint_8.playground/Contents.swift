import Foundation

//  Checkpoint 8
//  Make a protocol that describes a building.
//  Your protocol should require the following:
//     * A property storing how many rooms it has.
//     * A property storing the cost as an integer.
//     * A property storing the name of the estate agent selling the building.
//     * A method for printing the sales summary of the building.
//  Create two structs, House and Office, that conform to it.

protocol Building {
    var numberOfRooms: Int {get}
    var cost: Int {get}
    var nameOfAgent: String {get set}
    
    func printSelesSummary()
}

extension Building {
    func printSelesSummary() {
        print("Number of rooms: \(numberOfRooms)")
        print("Cost: \(cost)")
        print("Name of agent: \(nameOfAgent)")
    }
}

struct House: Building {
    var numberOfRooms: Int
    var cost: Int
    var nameOfAgent: String
}

struct Office: Building {
    var numberOfRooms: Int
    var cost: Int
    var nameOfAgent: String
}

var myHouse = House(numberOfRooms: 6, cost: 50_000, nameOfAgent: "Devid Warner")
var myOffice = Office(numberOfRooms: 20, cost: 80_00_000, nameOfAgent: "Karl Miler")

myHouse.printSelesSummary()
myOffice.printSelesSummary()
