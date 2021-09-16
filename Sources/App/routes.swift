import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!! :D"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }

    
}
/*
 /*
var sudokuBoard = [ [0, 0,0,0,0,0,0,0,0,0],
                    [0, 0,0,0,2,6,0,7,0,1],
                    [0, 6,8,0,0,7,0,0,9,0],
                    [0, 1,9,0,0,0,4,5,0,0],
                    [0, 8,2,0,1,0,0,0,4,0],
                    [0,0,0,4,6,0,2,9,0,0],
                    [0,0,5,0,0,0,3,0,2,8],
                    [0,0,0,9,3,0,0,0,7,4],
                    [0,0,4,0,0,5,0,0,3,6],
                    [0,7,0,3,0,1,8,0,0,0]]
var sudokuFlags = [ [false, false, false, false, false, false, false, false, false, false],
                    [false, false, false, false, false, false, false, false, false, false],
                    [false, false, false, false, false, false, false, false, false, false],
                    [false, false, false, false, false, false, false, false, false, false],
                    [false, false, false, false, false, false, false, false, false, false],
                    [false, false, false, false, false, false, false, false, false, false],
                    [false, false, false, false, false, false, false, false, false, false],
                    [false, false, false, false, false, false, false, false, false, false],
                    [false, false, false, false, false, false, false, false, false, false],
                    [false, false, false, false, false, false, false, false, false, false]]
var sudokuFrequencies = [
  1 : 0,
  2 : 0,
  3 : 0,
  4 : 0,
  5 : 0,
  6 : 0,
  7 : 0,
  8 : 0,
  9 : 0,
  0 : 0

]
func setSudokuFlags() {
    for row in 1 ... 9 {
        for column in  1 ... 9 {
            if sudokuBoard[row][column] > 0 {
                sudokuFlags[row][column] = true
            }
        }
    }
}

setSudokuFlags()

func setSudokuFrequencies() {
    for row in 1 ... 9 {
        for column in 1 ... 9 {
            print(sudokuFrequencies[sudokuFlags[row][column]])
        }
    }
}
                      
 */
func printBoard() {
    for i in 0 ..< board.count {
        if i % 9 == 0 {
            print()
        }
        print(board[i].number, terminator: " ")
    }
    print()
}

func checkRow(rowNum: Int, number: Int) -> Bool {
    for square in board {
        if square.row == rowNum && square.number == number {
            return false
        }
    }
    return true
}
                                         

 */
