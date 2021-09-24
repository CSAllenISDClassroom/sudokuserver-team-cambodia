////////////////////////////////////////////////////////////////////////////////////////////////////////
//The parent class is responsible for creating an array of nine cell values
////////////////////////////////////////////////////////////////////////////////////////////////////////
class SudokuNumberGroup {

    public var cells : [Cell]

    //The precodintion prevents the creation of an array of cells that exceeds or is below the amount of 9 cells
    init(cellsArray: [Cell]) {
        precondition(cellsArray.count == 9, "An attempt was made to initialize a row without 9 cells")
        self.cells = cellsArray
    }
}

//Child classes

//A Row is a horizontal collection of cells, 9 cells long
class Row: SudokuNumberGroup {}     

//A Box represents the nine boxes of numbers on a Sudoku board
class Box: SudokuNumberGroup {}

//A Column is the vertical collection of cells, 9 cells long
class Column: SudokuNumberGroup {}
