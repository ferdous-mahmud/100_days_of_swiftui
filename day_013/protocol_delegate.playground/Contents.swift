import Foundation

// Protocol
// Contract for swift code
protocol Vehicle {
    var name: String {  get } // Readable
    var currentPassengers: Int { get set } // Readable and wrritable
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {   // Confirms Vehicle protocol
    let name = "Car"
    var currentPassengers = 2
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I am travelling by \(name) \(distance)km with \(currentPassengers) passengers")
    }
    
    func openSunRoof(isNiceDay: Bool) {
        if isNiceDay {
            print("Sun roof open now!")
        } else {
            print("Sorry! I can't open sun roof")
        }
    }
}

struct Bicycle: Vehicle {   // Confirms Vehicle protocol
    var name = "Bicycle"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I an travelling by \(name) \(distance)km with \(currentPassengers) passengers")
    }
    
    
}

func commute(distance: Int, using vecicle: Vehicle) {
    if vecicle.estimateTime(for: distance) > 100 {
        print("This is a slow car!")
    } else {
        vecicle.travel(distance: distance)
    }
}

var car = Car()
commute(distance: 100, using: car)
var bicycle = Bicycle()
commute(distance: 20, using: bicycle)
