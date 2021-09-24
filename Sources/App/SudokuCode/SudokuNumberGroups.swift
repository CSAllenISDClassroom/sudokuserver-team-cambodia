//Parent class
class SudokuNumberGroup {

    public var cells : [Cell]
    init(cellsArray: [Cell]) {
        precondition(cellsArray.count == 9, "An attempt was made to initialize a row without 9 cells")
        self.cells = cellsArray
    }
}

//Child classes
class Row: SudokuNumberGroup {}     // A Row is a horizontal collection of cells, 9 cells long
class Box: SudokuNumberGroup {}
class Column: SudokuNumberGroup {}
