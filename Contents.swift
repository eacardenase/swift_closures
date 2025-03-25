import Cocoa

var volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]

func isAscending(_ i: Int, _ j: Int) -> Bool {
    return i < j
}

//let volunteerSorted = volunteerCounts.sorted(by: isAscending)

//let volunteerSorted = volunteerCounts.sorted(by: { (i: Int, j: Int) -> Bool in
//    return i < j
//})

//let volunteerSorted = volunteerCounts.sorted { (i: Int, j: Int) -> Bool in
//    return i < j
//}

//let volunteerSorted = volunteerCounts.sorted { (i: Int, j: Int) -> Bool in
//    i < j
//}

//let volunteerSorted = volunteerCounts.sorted(by: { i, j in i < j })

//let volunteerSorted = volunteerCounts.sorted { i, j in i < j }

volunteerCounts.sort { $0 < $1 }
volunteerCounts

let volunteerSorted = volunteerCounts.sorted { $0 < $1 }

print(volunteerSorted)

func doAwesomeWork(on input: String,
                   using transformer: (String) -> Void,
                   then completion: () -> Void) {
    // Do something awesome here
    
    transformer(input)
    completion()
}

doAwesomeWork(on: "My Project") {
    print("Doing work on \($0) in `transformer`")
} then: {
    print("Finishing up in `completion`")
}

//func format(numbers: [Double], using formatter: (Double) -> String) -> [String] {
//    var result = [String]()
//    
//    for number in numbers {
//        let transformed = formatter(number)
//        
//        result.append(transformed)
//    }
//    
//    return result
//}

func format(numbers: [Double], using formatter: (Double) -> String = { "\($0)" }) -> [String] {
    var result = [String]()
    
    for number in numbers {
        let transformed = formatter(number)
        
        result.append(transformed)
    }
    
    return result
}

let rounder: (Double) -> String = { num in
    "\(Int(num.rounded()))"
}

let volunteerAverage = [10.75, 4.2, 1.5, 12.12, 16.815]
let roundedAveragesAsStrings = format(numbers: volunteerAverage, using: rounder)
let exactAveragesAsStrings = format(numbers: volunteerAverage)

//func experimentWithScopes() {
//    var numberOfTransformations = 0
//    
//    let rounder: (Double) -> String = { num in
//        numberOfTransformations += 1
//        
//        return "\(Int(num.rounded()))"
//    }
//    
//    let volunteerAverage = [10.75, 4.2, 1.5, 12.12, 16.815]
//    let roundedAveragesAsStrings = format(numbers: volunteerAverage, using: rounder)
//    let exactAveragesAsStrings = format(numbers: volunteerAverage)
//    
//    print(numberOfTransformations)
//}

//experimentWithScopes()

let roundedAverages = volunteerAverage.map { avg in
    Int(avg.rounded())
}
//let roundedAverages = volunteerAverage.map { Int($0.rounded()) }

let passingAverages = roundedAverages.filter { avg in
    avg > 10
}

let estimatedParticipation = passingAverages.reduce(5) { partialResult, curr in
    partialResult + curr
}

let finalStimate = volunteerAverage.map { Int($0.rounded()) }.filter { $0 > 10 }.reduce(5) { $0 + $1 }
print(finalStimate)
