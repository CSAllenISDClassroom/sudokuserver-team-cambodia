class SudokuBoard {

    class s{
        public var row : Int
        public var column : Int
        public var box : Int
        public var number : Int? = 0
        public var cell : Int
        init(r: Int, c: Int, b: Int, l : Int) {
            self.row = r
            self.column = c
            self.box = b
            self.cell = l
        }
    }

    var board = [s(r: 1, c: 1, b: 1, l: 1), s(r: 1, c: 2, b: 1, l: 2), s(r: 1, c: 3, b: 1, l: 3), s(r: 1, c: 4, b: 2, l: 1), s(r: 1, c: 5, b: 2, l: 2), s(r: 1, c: 6, b: 2, l: 3), s(r: 1, c: 7, b: 3, l: 1), s(r: 1, c: 8, b: 3, l: 2), s(r: 1, c: 9, b: 3, l: 3),
                 s(r: 2, c: 1, b: 1, l: 4), s(r: 2, c: 2, b: 1, l: 5), s(r: 2, c: 3, b: 1, l: 6), s(r: 2, c: 4, b: 2, l: 4), s(r: 2, c: 5, b: 2, l: 5), s(r: 2, c: 6, b: 2, l: 6), s(r: 2, c: 7, b: 3, l: 4), s(r: 2, c: 8, b: 3, l: 5), s(r: 2, c: 9, b: 3, l: 6),
                 s(r: 3, c: 1, b: 1, l: 7), s(r: 3, c: 2, b: 1, l: 8), s(r: 3, c: 3, b: 1, l: 9), s(r: 3, c: 4, b: 2, l: 7), s(r: 3, c: 5, b: 2, l: 8), s(r: 3, c: 6, b: 2, l: 9), s(r: 3, c: 7, b: 3, l: 7), s(r: 3, c: 8, b: 3, l: 8), s(r: 3, c: 9, b: 3, l: 9),

                 s(r: 4, c: 1, b: 4, l: 1), s(r: 4, c: 2, b: 4, l: 2), s(r: 4, c: 3, b: 4, l: 3), s(r: 4, c: 4, b: 5, l: 1), s(r: 4, c: 5, b: 5, l: 2), s(r: 4, c: 6, b: 5, l: 3), s(r: 4, c: 7, b: 6, l: 1), s(r: 4, c: 8, b: 6, l: 2), s(r: 4, c: 9, b: 6, l: 3),
                 s(r: 5, c: 1, b: 4, l: 4), s(r: 5, c: 2, b: 4, l: 5), s(r: 5, c: 3, b: 4, l: 6), s(r: 5, c: 4, b: 5, l: 4), s(r: 5, c: 5, b: 5, l: 5), s(r: 5, c: 6, b: 5, l: 6), s(r: 5, c: 7, b: 6, l: 4), s(r: 5, c: 8, b: 6, l: 5), s(r: 5, c: 9, b: 6, l: 6),
                 s(r: 6, c: 1, b: 4, l: 7), s(r: 6, c: 2, b: 4, l: 8), s(r: 6, c: 3, b: 4, l: 9), s(r: 6, c: 4, b: 5, l: 7), s(r: 6, c: 5, b: 5, l: 8), s(r: 6, c: 6, b: 5, l: 9), s(r: 6, c: 7, b: 6, l: 7), s(r: 6, c: 8, b: 6, l: 8), s(r: 6, c: 9, b: 6, l: 9),

                 s(r: 7, c: 1, b: 7, l: 1), s(r: 7, c: 2, b: 7, l: 2), s(r: 7, c: 3, b: 7, l: 3), s(r: 7, c: 4, b: 8, l: 1), s(r: 7, c: 5, b: 8, l: 2), s(r: 7, c: 6, b: 8, l: 3), s(r: 7, c: 7, b: 9, l: 1), s(r: 7, c: 8, b: 9, l: 2), s(r: 7, c: 9, b: 9, l: 3),
                 s(r: 8, c: 1, b: 7, l: 4), s(r: 8, c: 2, b: 7, l: 5), s(r: 8, c: 3, b: 7, l: 6), s(r: 8, c: 4, b: 8, l: 4), s(r: 8, c: 5, b: 8, l: 5), s(r: 8, c: 6, b: 8, l: 6), s(r: 8, c: 7, b: 9, l: 4), s(r: 8, c: 8, b: 9, l: 5), s(r: 8, c: 9, b: 9, l: 6),
                 s(r: 9, c: 1, b: 7, l: 7), s(r: 9, c: 2, b: 7, l: 8), s(r: 9, c: 3, b: 7, l: 9), s(r: 9, c: 4, b: 8, l: 7), s(r: 9, c: 5, b: 8, l: 8), s(r: 9, c: 6, b: 8, l: 9), s(r: 9, c: 7, b: 9, l: 7), s(r: 9, c: 8, b: 9, l: 8), s(r: 9, c: 9, b: 9, l: 9)
    ]

    func returnBoard() -> [s] {
        return board
    }
    func checkRow(rowNum: Int, number: Int) -> Bool{

        for square in board {
            if square.row == rowNum && square.number == number{
                return false
            }
        }

        return true
    }

    func checkColumn(columnNum: Int, number: Int) -> Bool{

        for square in board {
            if square.column == columnNum && square.number == number{
                return false
            }
        }

        return true
    }

    func checkBox(boxNum: Int, number: Int) -> Bool {
        for square in board {
            if square.box == boxNum && square.number == number{
                return false
            }
        }

        return true
    }

    func getIndexesOfBox(boxNum: Int) -> [Int] {
        var indexes = [Int]()

        for i in 0 ..< board.count {
            if board[i].box == boxNum {
                indexes.append(i)
            }
        }

        return indexes
    }

    func removeNum(number : Int) {
        for i in 0 ..< board.count {
            if board[i].number == number {
                board[i].number = 0
            }
        }
    }

    func placeNum(boxNum : Int, number : Int) -> Bool{
        let indexesOfBox = getIndexesOfBox(boxNum : boxNum)
        for _ in 1 ... 100 {
            let randomIndex = indexesOfBox[Int.random(in: 0 ..< indexesOfBox.count)]
            if board[randomIndex].number == 0 && checkRow(rowNum : board[randomIndex].row, number : number) && checkColumn(columnNum : board[randomIndex].column, number : number) && checkBox(boxNum: board[randomIndex].box, number : number) {
                board[randomIndex].number = number
                break
            }
        }
    }

    //ABOVE IS LOGIC AND CODE TO MAKE A VALID SUDOKU BOARD
    //BELOW IS PROPER FORMATTING
    
    func generateBoard() -> Board {
        var isComplete = false
        var numsZero = 0

        while !isComplete {
            for box in 1 ... 9 {
                for num in 1 ... 9 {
                    placeNum(boxNum : box, number : num)
                }
            }
            
            for square in board {
                if square.number == 0 {
                    numsZero += 1
                }
            }

            if numsZero == 0 {
                isComplete = true
            } else {
                numsZero = 0
                for num in 1 ... 9 {
                    removeNum(number: num)
                }
            }
        }


        //at this point, board is complete and generated
        var finalBoard = Board()

        for i in 0 ... 80 {
            finalBoard.board[board[i].box - 1].cells[board[i].cell - 1].value = board[i].number
        }

        return finalBoard
    }

    func printBoard() {
        
        let testBoard = generateBoard()

        for box in 0 ... 8 {
            for cell in 0 ... 8 {
                print(testBoard.board[box].cells[cell].value, terminator: "")
            }
            print()
        }
    }

    func allBoardValues()  {
        print(printBoard())
    } 

    func retrieveIncorrectBoardValues(playerBoard:[[Int]], solutionBoard:[[Int]]) -> [Int] {
        var incorrectValuesArray = [Int]()
        for box in 0 ..< playerBoard.count {
            for cellIndex in 0 ..< box.count {
                if playerBoard[box][cellIndex] != solutionBoard[box][cellIndex] {
                    incorrectValuesArray.append(cellIndex)    
                }
            }
            
        }
        return incorrectValuesArray
    }

    func retrieveRepeatedBoardValues(playerBoard:[[Int]], solutionBoard:[[Int]]) -> [Int] {
        var repeatedValuesArray = [Int]()
        
        /*

         for box in board {  
         for number in box {
         for numberToBeChecked in box {
         if number == numberToBeChecked {
         FLAG (append to an array?)

         */
        for box in board {
            for number in box {
                for numberToBeChecked in box {
                    if number == numberToBeChecked {
                        repeatedValuesArray.append(board[number][numberToBeChecked])
                    }
                }
            }
        }
    }
    
    func filter(filter:String, solutionBoard: Board , playerBoard: Board) {


        switch filter {
        case "all":
            allBoardValues()
        case "repeated":
            print()
            //repeatedBoardValues()
        case "incorrect":
            print()
            //incorrectBoardValues()
        default:
            filter = "all"

        }
    }
}
func removeNumberFromSudokuBoard(columnIndex:Int,rowIndex: Int) {
    //sodoku.board is the board made up of s classes
    for i in 0 ..< SudokuBoard().returnBoard().count {
        if SudokuBoard().returnBoard()[i].column == columnIndex && SudokuBoard().returnBoard()[i].row == rowIndex  {

            SudokuBoard().returnBoard()[i].number = nil

        }
    }

}

func removeNumbers(numbersToRemove:Int) {
    //removes the numbers
    for _ in  1...numbersToRemove {
        //removes a number at a random box Index and cell index
        removeNumberFromSudokuBoard(columnIndex:(Int.random(in:0..<9)), rowIndex: Int.random(in: 0..<9))

    }

}

func setDifficulty(difficulty: String) {

    if difficulty == "easy" {
        removeNumbers(numbersToRemove: 5)
    }
    if difficulty == "medium" {
        removeNumbers(numbersToRemove: 10)
    }
    if difficulty == "hard" {
        removeNumbers(numbersToRemove: 15)
    }
    if difficulty == "hell" {
        removeNumbers(numbersToRemove: 20)
    }


}
