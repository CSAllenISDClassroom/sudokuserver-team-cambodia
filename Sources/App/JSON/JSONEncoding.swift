import Foundation
import Vapor 

let JSONboard: [[s]] = GeneratedBoard() 
 
let encoder = JSONEncoder()

// This function turns teh JSON code into a readable string 
func readableJSONData() -> String  { 
    guard let data = try? encoder.encode(JSONboard),
          let json = String(data: data, encoding: .utf8) else {
        fatalError("Failed to encode data into json.")
    }
    return (json)
}

<<<<<<< HEAD
}
 
=======
>>>>>>> c414944c23cf539e6203d205c6f4c6b1e96cd179
