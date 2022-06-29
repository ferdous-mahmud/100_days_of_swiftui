import Foundation

//  Checkpoint 6
//  * Create a struct to store information about a car. Include:
//      - Its model
//      - Number of seats
//      - Current gear
//  * Add a method to change gears up or down.
//  * Have a think about variables and access control.
//  * Don't allow invalid gears 1...10 seems a fair maximum range.

struct Car {
    private(set) var model: String
    private(set) var numberOfSeat: Int
    private var currentGear = 1
    
    init ( model: String, numberOfSeat: Int) {
        self.model = model
        self.numberOfSeat = numberOfSeat
    }
    
    mutating func changeGear (_ gear: Int) -> Bool {
        if gear < 10 && gear > 0 {
            print("Successfully change gear")
            self.currentGear = gear
            return true
        } else {
            print("Invalid gear option!")
        }
        return false
    }
}

var tesla = Car(model: "Tesla v2", numberOfSeat: 4)
tesla.changeGear(5)

print(tesla.model)


