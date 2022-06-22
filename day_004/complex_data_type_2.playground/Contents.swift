// Create an array of strings, then write some code that prints the number
// of intems in the array and also the number of unique items in the array

var employes = [
    "Devid",
    "paul",
    "Watson",
    "Cris",
    "Devid",
    "paul",
]

print(employes.count)

var empSet: Set<String> = []
var empDec = [String: Int]()

for i in 0...employes.count - 1 {
    if !empSet.contains(employes[i]) {
        empSet.insert(employes[i])
        empDec[employes[i]] = 1
    }else{
        empDec[employes[i]] = 2
    }
}

for (key, value) in empDec {
    if value == 1 {
        print(key)
    }
}


