
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//The class below creates a new board by randomly choosing values from 1...9 in order to create a solvable sudoku board
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
import Vapor



class s{
    public var box : Int
    public var cellIndex: Int
    public var number = 0

    init(b: Int, i: Int) {
        self.box = b
        self.cellIndex = i
    }
}

var board = [[s(b: 0, i: 0), s(b: 0, i: 1), s(b: 0, i: 2), s(b: 0, i: 3), s(b: 0, i: 4), s(b: 0, i: 5), s(b: 0, i: 6), s(b: 0, i: 7), s(b: 0, i: 8)],
             [s(b: 1, i: 0), s(b: 1, i: 1), s(b: 1, i: 2), s(b: 1, i: 3), s(b: 1, i: 4), s(b: 1, i: 5), s(b: 1, i: 6), s(b: 1, i: 7), s(b: 1, i: 8)],
             [s(b: 2, i: 0), s(b: 2, i: 1), s(b: 2, i: 2), s(b: 2, i: 3), s(b: 2, i: 4), s(b: 2, i: 5), s(b: 2, i: 6), s(b: 2, i: 7), s(b: 2, i: 8)],

             [s(b: 3, i: 0), s(b: 3, i: 1), s(b: 3, i: 2), s(b: 3, i: 3), s(b: 3, i: 4), s(b: 3, i: 5), s(b: 3, i: 6), s(b: 3, i: 7), s(b: 3, i: 8)],
             [s(b: 4, i: 0), s(b: 4, i: 1), s(b: 4, i: 2), s(b: 4, i: 3), s(b: 4, i: 4), s(b: 4, i: 5), s(b: 4, i: 6), s(b: 4, i: 7), s(b: 4, i: 8)],
             [s(b: 5, i: 0), s(b: 5, i: 1), s(b: 5, i: 2), s(b: 5, i: 3), s(b: 5, i: 4), s(b: 5, i: 5), s(b: 5, i: 6), s(b: 5, i: 7), s(b: 5, i: 8)],

             [s(b: 6, i: 0), s(b: 6, i: 1), s(b: 6, i: 2), s(b: 6, i: 3), s(b: 6, i: 4), s(b: 6, i: 5), s(b: 6, i: 6), s(b: 6, i: 7), s(b: 6, i: 8)],
             [s(b: 7, i: 0), s(b: 7, i: 1), s(b: 7, i: 2), s(b: 7, i: 3), s(b: 7, i: 4), s(b: 7, i: 5), s(b: 7, i: 6), s(b: 7, i: 7), s(b: 7, i: 8)],
             [s(b: 8, i: 0), s(b: 8, i: 1), s(b: 8, i: 2), s(b: 8, i: 3), s(b: 8, i: 4), s(b: 8, i: 5), s(b: 8, i: 6), s(b: 8, i: 7), s(b: 8, i: 8)]]


func printBoard() -> String {
    var finalBoard = ""
    for i in 0 ..< board.count {
        for j in 0 ..< board[i].count {
            
            if i % 3 == 0 {
                finalBoard += "\n"
            }
            finalBoard += String(board[i][j].number) + " "
        }
    }
    finalBoard += "\n"
    return finalBoard
}



func checkRow(boxIndex: Int, cellIndex: Int) -> Bool{
    let currentBoxIndex = boxIndex % 3
    let currentCellIndex = cellIndex % 3
    for _ in board {        
        if board[currentBoxIndex][currentCellIndex].number == board[currentBoxIndex][currentCellIndex].number + 1 && board[currentBoxIndex][currentCellIndex].number == board[currentBoxIndex][currentCellIndex].number - 1 {
            return false
        }
        
    }

    return true
}

func checkColumn(boxIndex: Int, cellIndex: Int) -> Bool{

    for _ in board {
        let currentBoxIndex = boxIndex % 3
        let currentCellIndex = cellIndex % 3
        if board[currentBoxIndex][currentCellIndex].number == board[currentBoxIndex][currentCellIndex].number + 3 && board[currentBoxIndex][currentCellIndex].number == board[currentBoxIndex][currentCellIndex].number - 3 {
            return false
        }
    }
    
    return true
}

func checkBox(boxIndex: Int, cellIndex: Int) -> Bool {

    for box in board {
        for cell in box {
            if cell.box == boxIndex && cell.cellIndex == cellIndex {
                return false
            }
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

func generateBoard() -> String {
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
    return printBoard()
}

class GeneratedBoard {
    let finalBoard = generateBoard()
    let squaresInfo = board
}
