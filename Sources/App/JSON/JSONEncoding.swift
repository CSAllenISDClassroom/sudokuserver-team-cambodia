import Foundation
import Vapor 

let board = Board()
let encoder = JSONEncoder()
// This function turns teh JSON code into a readable string 
func readableJSONData() -> String  { 
guard let data = try? encoder.encode(board),
      let json = String(data: data, encoding: .utf8) else {
    fatalError("Failed to encode data into json.")
}
return (json)
} 

// Structure definitions
struct Position: Content {
    let boxIndex: Int
    let cellIndex: Int
}

struct Cell: Content {
    let position: Position
    let value: Int?
}
struct Box: Content {
    let cells: [Cell]

    init(boxIndex: Int) {
        var cells = [Cell]()
        for cellIndex in 0 ..< 9 {
            cells.append(Cell(position: Position(boxIndex: boxIndex, cellIndex: cellIndex), value: cellIndex))
        }
        self.cells = cells
    }
    
}

struct Board: Content {
    let board: [Box]

    init() {
        var board = [Box]()
        for boxIndex in 0 ..< 9 {
            board.append(Box(boxIndex: boxIndex))
        }
        self.board = board
    }
}
