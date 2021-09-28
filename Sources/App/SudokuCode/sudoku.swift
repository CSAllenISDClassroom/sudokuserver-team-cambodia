////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//The class below creates a new board by randomly choosing values from 1...9 in order to create a solvable sudoku board
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



class sudokuBoard {
    
    public var sudokuBoardRows = [[Int]]()
    public var sudokuBoardColumns = [[Int]]()
    public var sudokuBoardBoxes = [[Int]]()


    //When this function is invoked, a new board will be generated 
    public func generateNewBoard() {

        createEmptyArrays()
        

        //This loop will randomly select a number from 1...9 as the potentialNumber to place from an array of availableNumbers
        for row in 0...8 {
            
            for column in 0...8 {
                var potentialValue = 0
                potentialValue = Int.random(in: 1...9)
                var numberConflicts = doesNumberConflict(value)
                print(doesNumberConflict)

                
                
                appendValueToArrays(value:potentialValue, rowIndex:row, columnIndex: column)
            }
        }

        func createEmptyArrays() {
            for _ in 0...8 {
                let row = [Int]()
                sudokuBoardRows.append(row)
            }

            for _ in 0...8 {
                let column = [Int]()
                sudokuBoardColumns.append(column)
            }

            for _ in 0...8 {
                let box = [Int]()
                sudokuBoardBoxes.append(box)
            }
            
        }

        func appendValueToArrays(value: Int, rowIndex: Int, columnIndex: Int) {

            sudokuBoardRows[rowIndex].append(value)
            sudokuBoardColumns[columnIndex].append(value)
            sudokuBoardBoxes[findBoxIndex(rowIndex: rowIndex, columnIndex: columnIndex)].append(value)

        }

        func doesValueConflict(value: Int, rowIndex: Int, columnIndex: Int) -> Bool {
            doesValueConflict = false

            for rowIndex in sudokuBoardRows[rowIndex] {
                for number in row {
                    if number == value {
                        doesValueConflict = true
                    }
                }
            }

            for columnIndex in sudokuBoardRows[columnIndex] {
                for number in row {
                    if number == value {
                        doesValueConflict = true
                    }
                }
            }

            let boxIndex = findBoxIndex(rowIndex: rowIndex, columnIndex: columnIndex)
            
            for boxIndex in sudokuBoardRows[boxIndex] {
                for number in box {
                    if number == value {
                        doesValueConflict = true
                    }
                }
            }
        }

        func findBoxIndex(rowIndex: Int, columnIndex: Int) -> Int{
            let boxRow = rowIndex / 3
            let boxColumn = columnIndex / 3
            let boxIndex = (boxRow * 3) + boxColumn

            precondition(boxIndex >= 0 && boxIndex <= 8, "boxIndex \(boxIndex) is out of bounds")
            return boxIndex
        }
    }
}
