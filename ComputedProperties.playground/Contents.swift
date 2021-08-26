import Foundation

var width: Float = 3.4
var height: Float = 2.1

var bucketsOfPaint: Int {
    get {
        let area = width * height
        let areaCoveredPerBucket: Float = 1.5
        let numberOfBuckets = area / areaCoveredPerBucket
        let roundedBuckets = ceilf(numberOfBuckets)
        return Int(roundedBuckets)
    }
    
    set {
        let areaCanCover = Double(newValue) * 1.5
        print("This amount of paint can cover an area of \(areaCanCover)")
    }
}

bucketsOfPaint = 8

/*
// Explanation of Computed Properties
var pizzaInInches: Int = 10 {
    willSet {
//        print(pizzaInInches)
//        print(newValue)
    }
    didSet {
//        print(oldValue)
//        print(pizzaInInches)
        if pizzaInInches >= 18 {
            print("Invalid size specified, pizzaInInches set to 18")
            pizzaInInches = 18
        }
    }
}

pizzaInInches = 33

var numberOfPeople: Int = 12
let slicesPerPerson: Int = 4

var numberOfSlices: Int {
    get {
        return pizzaInInches - 4
    }
//    set {
//        print("numberOfSlices now has a new value which is \(newValue)")
//    }
}

var numberOfPizza: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}

numberOfPizza = 4

print(numberOfPeople)
 */
