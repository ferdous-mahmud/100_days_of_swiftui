import Foundation


// Memberwise Initializer (Using properties)
struct Player {
    let name: String
    let number: Int
}

let player1 = Player(name: "Warnar Harray", number: 1)
print(player1.number)


// Custor initializer
struct Country {
    let capital: String
    let currency: String
    let ranking: Int
    let numberOfCitys: Int
    
    init (capital: String, currency: String) {
        self.capital = capital
        self.currency = currency
        self.ranking = Int.random(in: 1...100) //
        self.numberOfCitys = 100
    }
    
    // Multiple initializer for a single struct
    init (capital: String) {
        self.capital = capital
        self.numberOfCitys = Int.random(in: 1000...50000)
        self.ranking = Int.random(in: 1...100) //
        self.currency = "$"
    }
}

let bangladesh = Country(capital: "ঢাকা", currency: "Taka")
let india = Country(capital: "Dellhi")
print(bangladesh.currency)
print(bangladesh.capital)
print(bangladesh.ranking)
print(india.numberOfCitys)
