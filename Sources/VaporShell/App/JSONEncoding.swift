import Foundation

let encoder = JSONEncoder()

struct CodablePosition : Codable {
    let boxIndex : Int
    let cellIndex : Int
}

struct CodableCell : Codable {
    let position : CodablePosition
    let value : Int?
}

struct CodableBox : Codable {
    let cells : [CodableCell]

    init(boxIndex: Int, boxValues: [Int]) {
        var cells = [codableCells]
        for cellIndex in 0..<9 {
            cells.append(CellCodable(position: CodablePosition(boxIndex: boxIndex, cellIndex: cellIndex), value: boxValues[cellIndex]))
        }
        self.cells = cells
    }
}

struct CodableBoard : Codable {
    let board : [CodableBox]
    
}
    
