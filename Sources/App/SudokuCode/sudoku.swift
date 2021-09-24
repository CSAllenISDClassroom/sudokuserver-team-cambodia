////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//The class below creates a new board by randomly choosing values from 1...9 in order to create a solvable sudoku board
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class sudokuBoard {

    //When this function is invoked, a new game will be generated 
    public func generateNewBoard() {
        
        var availableNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        var firstArray = [Int]()
        //This loop will randomly select a number from 1...9 as the potentialNumber to place from an array of availableNumbers
        for _ in 0...8 {
            var randomIndex = 0
            var potentialValue = 0
            //let numberConflicts = false
            
            randomIndex = Int.random(in: 0 ... availableNumbers.count - 1)
            potentialValue = availableNumbers[randomIndex]
            firstArray.append(potentialValue)
            availableNumbers.remove(at: randomIndex)

        }

        
    }
}

