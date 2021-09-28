////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//The class below creates a new board by randomly choosing values from 1...9 in order to create a solvable sudoku board
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class sudokuBoard {
    
    public var sudokuBoardRows = [[Int]]()
    public var sudokuBoardColumns = [[Int]]()
    public var sudokuBoardBoxes = [[Int]]()

    //When this function is invoked, a new board will be generated 
    public func generateNewBoard() {
        
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
                availableNumbers.remove(at: randomIndex)

            }
        }
        
        func isValueInColumn(columnNumber:Int, value:Int)-> Bool {
            var isValueInColumn = false 
            for row in sudokuBoard {
                if row[columnNumber] == value  {
                    isValueInColumn == true
                } 
            }
            return isValueInColumn 
        }
        func isValueInBox(topLeftColumnIndexOfBox:Int,firstRowIndexOfBox:Int,value:Int) -> Bool {
            var boxValues :[Int] = []
            var boxRows : [[Int]] = []
            var isValueInBox = false 
           
            boxRows.append(sudokuBoard[firstRowIndexOfBox],sudokuBoard[firstRowIndexOfBox+1],sudokuBoard[firstRowIndexOfBox+2])

            for row in boxRows {
                boxValues.append(row[topLeftColumnIndexOfBox],row[topLeftColumnIndexOfBox+1],row[topLeftColumnIndexOfBox+2])
                
            }

            for boxValue in boxValues {
                if boxValue == value{
                    isValueInBox = true
                }
            }
            return isValueInBox 
                
           
    }
    }
}

