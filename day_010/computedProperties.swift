var vacationAlocated = 20
let vacationTaken = 10

// computed properties
var remainingVacation: Int {
    return vacationAlocated - vacationTaken
}

print(remainingVacation)

// Computed properties with getter and setter
var vacationRemaining: Int {
    get {
        if vacationAlocated == 20 { // we can use if else
            return 20
        }
        return vacationAlocated - vacationTaken
    }

    set {
        for i in 0...1{ // loop in computed properties
            print("Testing for in computed properties")
        }
        vacationAlocated = vacationTaken + newValue
    }
}

vacationRemaining = 20
print(vacationRemaining)


// Properties observers
// "willSet" observer to run before the property changed.
// "didSet" observer to run when the property just changed.
var score = 0 {
    // call before value change
    willSet {
        print ("Before score = \(score)")
    }
    // call after value change
    didSet {
        print("After score = \(score)")
    }
}

score = 10