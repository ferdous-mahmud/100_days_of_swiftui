import Foundation

class Animal {
    let numberOfLeg: Int
    init(numberOfLeg: Int) {
        self.numberOfLeg = numberOfLeg
    }
}

class Dog: Animal {
    let speakSound: String
    
    init (speakSound: String) {
        self.speakSound = speakSound
        super.init(numberOfLeg: 4)
    }
    
    func speak() {
        print("I am Dog")
    }
}

class Corgi: Dog {
    init() {
        super.init(speakSound: "GheeeeuGheheu")
    }
    
    override func speak() {
        print("I am Corgi")
    }
}

class Poodle: Dog {
    init() {
        super.init(speakSound: "Huuuoiwros")
        print("I am Poodle")
    }
}

class Cat: Animal {
    let speakSound: String
    let cutenessReting: Int
    
    init (speakSound: String, cutenessReting: Int) {
        self.speakSound = speakSound
        self.cutenessReting = cutenessReting
        super.init(numberOfLeg: 4)
    }
    
    func speak() {
        print("I am Cat")
    }
}

class Persian: Cat {
    init() {
        super.init(speakSound: "Jhfkasfjisakfas", cutenessReting: 3)
    }
    
    override func speak() {
        print("I am Persian")
    }
}

class Lion: Cat {
    let name: String
    init(name: String) {
        self.name = name
        super.init(speakSound: "Hallum", cutenessReting: 3)
    }
    
    override func speak() {
        print("I am \(name). King of jungle!")
    }
}

let lion1 = Lion(name: "Kerlonne")
lion1.speak()

