import Foundation

// Clousers -> A bit like anonymus funciton
func sayHello () {
    print("Hello...")
}

var copyofsayHello = sayHello // when copy call function without ()
copyofsayHello()

// simple clouser
let printHello = {
    print("Hello")
}
printHello()

let printName = {(_ name: String) -> String in 
    "Hi \(name)"
}
print(printName("Ferdous"))


func getuserData (for id: Int) -> String {
    if id == 1989 {
        return "Tailor Swift"
    } else {
        return "Anonymus"
    }
}

let data: (Int) -> String = getuserData
let user = data(1989)
print(user)

// Custom sort function -> pass function in a function parameter
let team = ["Akash", "Nodi", "Ferdous", "Kakoli", "Azad"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSort (name1: String, name2: String) -> Bool {
    if name1 == "Nodi" {
        return true
    } else if name2 == "Nodi" {
        return false
    }
    return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSort)
print(captainFirstTeam)


// Closer version of captainFirstSort()
let captainFirstTeamUsingCloser = team.sorted(by: {(name1: String, name2: String) -> Bool in
    if name1 == "Nodi" {
        return true
    } else if name2 == "Nodi" {
        return false
    }

    return name1 < name2
})

print(captainFirstTeamUsingCloser)

// Trailing Colosrs
let reverseSort = team.sorted{ $0 > $1}
print(reverseSort)

let Aonly = team.filter{ $0.hasPrefix("A")}
print(Aonly)

let upperCasedTeam = team.map {$0.uppercased()}
print(upperCasedTeam)


// Accept funciton as a parameters
func makeArray (size: Int, using generator: () -> Int ) -> [Int] {
    var numArray = [Int]()
    for _ in 0...size {
        let newNumber = generator()
        numArray.append(newNumber)
    }
    return numArray
}

let array = makeArray(size: 10) { 
    return 23 // Int.random
}
print(array)


func doImportantWork(first: () -> void, second: () -> void, third: () -> void) {
    print("Starting first work")
    first()
    print("Starting second wrok")
    second()
    print("Starting third work")
    third()
    print("Done!")
}

doImportantWork {
    print("First Work done")
} second: {
    print("Second work done")
} third : {
    print("Third work done")
}
