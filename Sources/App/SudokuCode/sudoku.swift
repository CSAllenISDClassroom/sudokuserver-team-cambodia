////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//The class below creates a new board by randomly choosing values from 1...9 in order to create a solvable sudoku board
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class sudokuBoard {
    
    public var sudokuBoardRows = [[Int]]()
    public var sudokuBoardColumns = [[Int]]()
    public var sudokuBoardBoxes = [[Int]]()


    //When this function is invoked, a new board will be generated 
    public func generateNewBoard() {

        createNewEmptyArrays()
        
        var availableNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        var firstArray = [Int]()
        //This loop will randomly select a number from 1...9 as the potentialNumber to place from an array of availableNumbers
        for row in 0...8 {
            
            for column in 0...8 {
                var randomIndex = 0
                var potentialValue = 0
                //let numberConflicts = false
                
                randomIndex = Int.random(in: 0 ..< availableNumbers.count)
                potentialValue = availableNumbers[randomIndex]
                firstArray.append(potentialValue)
                //                availableNumbers.remove(at: randomIndex)

                appendValueToArrays(value:potentialValue, rowIndex:row, columnIndex: column)

            }
        }

        func createEmptyArrays() {
            for i in 0...8 {
                var row = [Int]()
                sudokuBoardRows.append(row)
            }

            for i in 0...8 {
                var column = [Int]()
                sudokuBoardColumns.append(column)
            }

            for i in 0...8 {
                var box = [Int]()
                sudokuBoardBoxes.append(box)
            }
            
        }

        func appendValueToArrays(value: Int, rowIndex: Int, columnIndex: Int) {

            sudokuBoardRows[rowIndex].append(value)
            sudokuBoardColumns[columnIndex].append(value)

            let boxRow = rowIndex / 3
            let boxColumn = columnIndex / 3
            let boxIndex = (boxRow * 3) + boxColumn

            precondition(boxIndex >= 0 && boxIndex <= 8, "boxIndex \(boxIndex) is out of bounds")
            sudokuBoardBoxes[boxIndex].append(value)
        }
    }
}
