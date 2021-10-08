import Foundation

let board = Board()
let encoder = JSONEncoder()

guard let data = try? encoder.encode(board),
      let json = String(data: data, encoding: .utf8) else {
    fatalError("Failed to encode data into json.")
}
print(json)

// Structure definitions
struct Position: Codable {
    let boxIndex: Int
    let cellIndex: Int
}

struct Cell: Codable {
    let position: Position
    let value: Int?
}
struct Box: Codable {
    let cells: [Cell]

    init(boxIndex: Int) {
        var cells = [Cell]()
        for cellIndex in 0 ..< 9 {
            cells.append(Cell(position: Position(boxIndex: boxIndex, cellIndex: cellIndex), value: cellIndex))
        }
        self.cells = cells
    }
}

struct Board: Codable {
    let board: [Box]

    init() {
        var board = [Box]()
        for boxIndex in 0 ..< 9 {
            board.append(Box(boxIndex: boxIndex))
        }
        self.board = board
    }
}
