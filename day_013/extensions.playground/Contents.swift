import Foundation

// We can use
var quote = "   This is my practice code for swift extention    "
var trimedQuote = quote.trimmingCharacters(in: .whitespaces)


// But it is very flexible
extension String {
    func trimed() -> String{
        self.trimmingCharacters(in: .whitespaces)
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

var trimedQuote2 = quote.trimed()

let lyrics = """
This is a multi line
String for testing
lines funciton form string extension
"""

print(lyrics.lines.count)



// Protocol Extension
protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello () {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let tailor = Employee(name: "Tailor Swift")
tailor.sayHello()
