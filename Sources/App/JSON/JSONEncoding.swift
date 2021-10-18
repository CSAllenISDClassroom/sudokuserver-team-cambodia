import Foundation
import Vapor 

let board: [[s]] = GeneratedBoard() 
 
let encoder = JSONEncoder()

// This function turns teh JSON code into a readable string 
func readableJSONData() -> String  { 
guard let data = try? encoder.encode(board),
      let json = String(data: data, encoding: .utf8) else {
    fatalError("Failed to encode data into json.")
}
return (json)

}
 
