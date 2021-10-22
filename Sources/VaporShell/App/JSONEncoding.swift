import Foundation

struct Position : Codable {
    let boxIndex : Int
    let cellIndex : Int
}

struct Cell : Codable {
    let position : Position
    let value : Int?
}

struct Box : Codable {
    let cells : [Cell]

    init(boxIndex: Int, boxValues: [Int]) {
        var cells = [Cell]
        for cellIndex in 0..<9 {
            cells.append(Cell(position: Position(boxIndex: boxIndex, cellIndex: cellIndex), value: boxValues[cellIndex]))
        }
        self.cells = cells
    }
}

struct Board : Codable {
    let board : [Box]

    init(board:[[Int]]) {
        var board = [Box]()
        for boxIndex in board {
            board.append(Box(boxIndex:boxIndex, boxValues: board[boxIndex]))
        }
        self.board = board
    }
}

func convertToBoard() -> Board {
    let board = SudokuBoard()
    board.generateBoard()
    let codableBoard = Board(board)
}
