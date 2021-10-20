import Foundation
import Vapor

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
