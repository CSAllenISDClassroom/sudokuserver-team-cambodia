class SudokuBoard {
    var finalBoard = Board()
    var solutionBoard = Board()
    
    init(difficulty:String) {
        let boardArray = generateBoard(difficulty:difficulty)
        self.finalBoard = boardArray[0]
        self.solutionBoard = boardArray[1]
    }
    
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

    func placeNum(boxNum : Int, number : Int){
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
    
    func generateBoard(difficulty:String) -> [Board] {
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

        var solutionBoard = Board()
        for i in 0 ... 80 {
            solutionBoard.board[board[i].box - 1].cells[board[i].cell - 1].value = board[i].number
        }

        setDifficulty(difficulty:difficulty)
        
        //at this point, board is complete and generated
        var finalBoard = Board()

        for i in 0 ... 80 {
            finalBoard.board[board[i].box - 1].cells[board[i].cell - 1].value = board[i].number
        }

        let boardArray = [finalBoard, solutionBoard]
        return boardArray
    }
    /*
    func printBoard() {
        
        let testBoard = generateBoard(difficulty:"hell")

        for box in 0 ... 8 {
            for cell in 0 ... 8 {
                print((testBoard.board[box].cells[cell].value)!, terminator: "")
            }
            print()
        }
    }
     */

    func changeValueInBoard(boxIndex: Int, cellIndex: Int, newValue: Int?){
        finalBoard.board[boxIndex].cells[cellIndex].value = newValue
    }

    /*
    func allBoardValues()  {
        print(printBoard())
    }
     */

    func returnIncorrectBoard(playerBoard:Board, solutionBoard:Board) -> Board {
        var incorrectCellPositions = [Position]()
        for boxIndex in 0 ..< playerBoard.board.count {
            for cellIndex in 0 ..< playerBoard.board[boxIndex].cells.count {
                if playerBoard.board[boxIndex].cells[cellIndex].value != solutionBoard.board[boxIndex].cells[cellIndex].value {
                    incorrectCellPositions.append(playerBoard.board[boxIndex].cells[cellIndex].position)    
                }
            }
        }

        var incorrectPositionsBoard = Board()

        for boxIndex in 0 ..< playerBoard.board.count {
            for cellIndex in 0 ..< playerBoard.board[boxIndex].cells.count {
                for position in incorrectCellPositions {
                    if cellIndex == position.cellIndex && boxIndex == position.boxIndex {
                        incorrectPositionsBoard.board[boxIndex].cells[cellIndex].value = playerBoard.board[boxIndex].cells[cellIndex].value
                    }
                }
            }
        }
        return incorrectPositionsBoard
    }

    func returnRepeatedBoard(playerBoard: Board, solutionBoard: Board) -> Board {
        var repeatedValuesBoard = Board()
        
        func checkRows() {
            for i in 0..<3 {
                for boxes in 0..<3 {
                    for boxIndex in (0 + (i*3))..<(3 + (i*3)) {
                        let trueBoxIndex = boxIndex + (i*3)
                        for cellIndex in 0..<3 {
                            let trueCellIndex = cellIndex + (boxes * 3)
                            
                            for checkIndex in 0 ..< 3 {
                                let trueCheckIndex = checkIndex + (boxes * 3)

                                if trueCheckIndex != trueCellIndex {
                                    if playerBoard.board[trueBoxIndex].cells[trueCellIndex].value == playerBoard.board[trueBoxIndex].cells[trueCheckIndex].value {
                                        repeatedValuesBoard.board[trueBoxIndex].cells[trueCellIndex].value = playerBoard.board[trueBoxIndex].cells[cellIndex].value
                                        repeatedValuesBoard.board[trueBoxIndex].cells[trueCheckIndex].value = playerBoard.board[trueBoxIndex].cells[trueCheckIndex].value
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        func checkColumns() {
            for _ in 0..<3 {
                for _ in 0..<3 {
                    for boxIndex in 0..<3 {
                        let trueBoxIndex = boxIndex + (boxIndex * 3)
                        
                        for cellIndex in 0..<3 {
                            let trueCellIndex = cellIndex + (cellIndex * 3)
                            
                            for checkIndex in 0 ..< 3 {
                                let trueCheckIndex = checkIndex+(checkIndex*3)

                                if trueCheckIndex != trueCellIndex {
                                    if playerBoard.board[trueBoxIndex].cells[trueCellIndex].value == playerBoard.board[trueBoxIndex].cells[trueCheckIndex].value {
                                        repeatedValuesBoard.board[trueBoxIndex].cells[trueCellIndex].value = playerBoard.board[trueBoxIndex].cells[cellIndex].value
                                        repeatedValuesBoard.board[trueBoxIndex].cells[trueCheckIndex].value = playerBoard.board[trueBoxIndex].cells[trueCheckIndex].value
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        
        func checkBoxes() {
            for boxIndex in 0..<playerBoard.board.count {
                for cellIndex in 0..<playerBoard.board[boxIndex].cells.count {
                    for checkIndex in 0..<playerBoard.board[boxIndex].cells.count {
                        if checkIndex != cellIndex {
                            if playerBoard.board[boxIndex].cells[cellIndex].value == playerBoard.board[boxIndex].cells[checkIndex].value {
                                repeatedValuesBoard.board[boxIndex].cells[cellIndex].value = playerBoard.board[boxIndex].cells[cellIndex].value
                                repeatedValuesBoard.board[boxIndex].cells[checkIndex].value = playerBoard.board[boxIndex].cells[checkIndex].value
                            }
                        }
                    }
                }
            }
        }

        checkRows()
        checkColumns()
        checkBoxes()
        
        return repeatedValuesBoard
    }
    
    func filter(filter:String, solutionBoard: Board) -> Board {
        var boardToBeReturned = Board()
        
        switch filter {
            
        case "all":
            boardToBeReturned = finalBoard
        case "repeated":
            boardToBeReturned = returnRepeatedBoard(playerBoard: finalBoard, solutionBoard: solutionBoard)
        case "incorrect":
            
            boardToBeReturned = returnIncorrectBoard(playerBoard: finalBoard, solutionBoard: solutionBoard)
        default:
            print("Something went wrong with the filter function switch statement")
            
        }
        return boardToBeReturned
    }
}

func removeNumberFromSudokuBoard(columnIndex:Int,rowIndex: Int, difficulty: String) {
    //sodoku.board is the board made up of s classes
    for i in 0 ..< SudokuBoard(difficulty:difficulty).returnBoard().count {
        if SudokuBoard(difficulty:difficulty).returnBoard()[i].column == columnIndex && SudokuBoard(difficulty:difficulty).returnBoard()[i].row == rowIndex  {

            SudokuBoard(difficulty:difficulty).returnBoard()[i].number = nil

        }
    }

}

func removeNumbers(numbersToRemove:Int, difficulty:String) {
    //removes the numbers


    for _ in  1...numbersToRemove {
        //removes a number at a random box Index and cell index
        removeNumberFromSudokuBoard(columnIndex:(Int.random(in:0..<9)), rowIndex: Int.random(in: 0..<9), difficulty:difficulty)

    }

}

func setDifficulty(difficulty: String) {

    if difficulty == "easy" {
        removeNumbers(numbersToRemove: 5, difficulty:difficulty)
    }
    if difficulty == "medium" {
        removeNumbers(numbersToRemove: 10, difficulty:difficulty)
    }
    if difficulty == "hard" {
        removeNumbers(numbersToRemove: 15, difficulty:difficulty)
    }
    if difficulty == "hell" {
        removeNumbers(numbersToRemove: 20, difficulty:difficulty)
    }


}
