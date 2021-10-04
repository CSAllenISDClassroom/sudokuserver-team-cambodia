////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//The class below creates a new board by randomly choosing values from 1...9 in order to create a solvable sudoku board
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



// class sudokuBoard {
    
//     public var sudokuBoardRows = [[Int]]()
//     public var sudokuBoardColumns = [[Int]]()
//     public var sudokuBoardBoxes = [[Int]]()
    
    
//     //When this function is invoked, a new board will be generated 
//     public func generateNewBoard() {
        
//         createEmptyArrays()
        
        
//         //This loop will randomly select a number from 1...9 as the potentialNumber to place from an array of availableNumbers
//         for row in 0...8 {
            
//             for column in 0...8 {
//                 var potentialValue = 0
//                 potentialValue = Int.random(in: 1...9)
//                 var numberConflicts = doesNumberConflict(value)
//                 print(doesNumberConflict)
                
                
                
//                 appendValueToArrays(value:potentialValue, rowIndex:row, columnIndex: column)
//             }
//         }
        
//         func createEmptyArrays() {
//             for _ in 0...8 {
//                 let row = [Int]()
//                 sudokuBoardRows.append(row)
//             }
            
//             for _ in 0...8 {
//                 let column = [Int]()
//                 sudokuBoardColumns.append(column)
//             }
            
//             for _ in 0...8 {
//                 let box = [Int]()
//                 sudokuBoardBoxes.append(box)
//             }
            
//         }
        
//         func appendValueToArrays(value: Int, rowIndex: Int, columnIndex: Int) {

//             sudokuBoardRows[rowIndex].append(value)
//             sudokuBoardColumns[columnIndex].append(value)
//             sudokuBoardBoxes[findBoxIndex(rowIndex: rowIndex, columnIndex: columnIndex)].append(value)

//         }
        
//         func doesValueConflict(value: Int, rowIndex: Int, columnIndex: Int) -> Bool {
//             doesValueConflict = false

//             for rowIndex in sudokuBoardRows[rowIndex] {
//                 for number in row {
//                     if number == value {
//                         doesValueConflict = true
//                     }
//                 }
//             }

//             for columnIndex in sudokuBoardRows[columnIndex] {
//                 for number in row {
//                     if number == value {
//                         doesValueConflict = true
//                     }
//                 }
//             }

//             let boxIndex = findBoxIndex(rowIndex: rowIndex, columnIndex: columnIndex)
            
//             for boxIndex in sudokuBoardRows[boxIndex] {
//                 for number in box {
//                     if number == value {
//                         doesValueConflict = true
//                     }
//                 }
//             }
//         }

//         func findBoxIndex(rowIndex: Int, columnIndex: Int) -> Int{
//             let boxRow = rowIndex / 3
//             let boxColumn = columnIndex / 3
//             let boxIndex = (boxRow * 3) + boxColumn

//             precondition(boxIndex >= 0 && boxIndex <= 8, "boxIndex \(boxIndex) is out of bounds")
//             return boxIndex
//         }
//     }
// }
class s{
    public var row : Int
    public var column : Int
    public var box : Int
    public var cellIndex: Int
    public var number = 0

    init(r: Int, c: Int, b: Int, i: Int) {
        self.row = r
        self.column = c
        self.box = b
        self.cellIndex = i
    }
}

var board = [s(r: 1, c: 1, b: 1, i: 1), s(r: 1, c: 2, b: 1, i: 2), s(r: 1, c: 3, b: 1, i: 3), s(r: 1, c: 4, b: 2, i: 1), s(r: 1, c: 5, b: 2, i: 2), s(r: 1, c: 6, b: 2, i: 3), s(r: 1, c: 7, b: 3, i: 1), s(r: 1, c: 8, b: 3, i: 2), s(r: 1, c: 9, b: 3, i: 3),
             s(r: 2, c: 1, b: 1, i: 4), s(r: 2, c: 2, b: 1, i: 5), s(r: 2, c: 3, b: 1, i: 6), s(r: 2, c: 4, b: 2, i: 4), s(r: 2, c: 5, b: 2, i: 5), s(r: 2, c: 6, b: 2, i: 6), s(r: 2, c: 7, b: 3, i: 4), s(r: 2, c: 8, b: 3, i: 5), s(r: 2, c: 9, b: 3, i: 6),
             s(r: 3, c: 1, b: 1, i: 7), s(r: 3, c: 2, b: 1, i: 8), s(r: 3, c: 3, b: 1, i: 9), s(r: 3, c: 4, b: 2, i: 7), s(r: 3, c: 5, b: 2, i: 8), s(r: 3, c: 6, b: 2, i: 9), s(r: 3, c: 7, b: 3, i: 7), s(r: 3, c: 8, b: 3, i: 8), s(r: 3, c: 9, b: 3, i: 9),

             s(r: 4, c: 1, b: 4, i: 1), s(r: 4, c: 2, b: 4, i: 2), s(r: 4, c: 3, b: 4, i: 3), s(r: 4, c: 4, b: 5, i: 1), s(r: 4, c: 5, b: 5, i: 2), s(r: 4, c: 6, b: 5, i: 3), s(r: 4, c: 7, b: 6, i: 1), s(r: 4, c: 8, b: 6, i: 2), s(r: 4, c: 9, b: 6, i: 3),
             s(r: 5, c: 1, b: 4, i: 4), s(r: 5, c: 2, b: 4, i: 5), s(r: 5, c: 3, b: 4, i: 6), s(r: 5, c: 4, b: 5, i: 4), s(r: 5, c: 5, b: 5, i: 5), s(r: 5, c: 6, b: 5, i: 6), s(r: 5, c: 7, b: 6, i: 4), s(r: 5, c: 8, b: 6, i: 5), s(r: 5, c: 9, b: 6, i: 6),
             s(r: 6, c: 1, b: 4, i: 7), s(r: 6, c: 2, b: 4, i: 8), s(r: 6, c: 3, b: 4, i: 9), s(r: 6, c: 4, b: 5, i: 7), s(r: 6, c: 5, b: 5, i: 8), s(r: 6, c: 6, b: 5, i: 9), s(r: 6, c: 7, b: 6, i: 7), s(r: 6, c: 8, b: 6, i: 8), s(r: 6, c: 9, b: 6, i: 9),

             s(r: 7, c: 1, b: 7, i: 1), s(r: 7, c: 2, b: 7, i: 2), s(r: 7, c: 3, b: 7, i: 3), s(r: 7, c: 4, b: 8, i: 1), s(r: 7, c: 5, b: 8, i: 2), s(r: 7, c: 6, b: 8, i: 3), s(r: 7, c: 7, b: 9, i: 1), s(r: 7, c: 8, b: 9, i: 2), s(r: 7, c: 9, b: 9, i: 3),
             s(r: 8, c: 1, b: 7, i: 4), s(r: 8, c: 2, b: 7, i: 5), s(r: 8, c: 3, b: 7, i: 6), s(r: 8, c: 4, b: 8, i: 4), s(r: 8, c: 5, b: 8, i: 5), s(r: 8, c: 6, b: 8, i: 6), s(r: 8, c: 7, b: 9, i: 4), s(r: 8, c: 8, b: 9, i: 5), s(r: 8, c: 9, b: 9, i: 6),
             s(r: 9, c: 1, b: 7, i: 7), s(r: 9, c: 2, b: 7, i: 8), s(r: 9, c: 3, b: 7, i: 9), s(r: 9, c: 4, b: 8, i: 7), s(r: 9, c: 5, b: 8, i: 8), s(r: 9, c: 6, b: 8, i: 9), s(r: 9, c: 7, b: 9, i: 7), s(r: 9, c: 8, b: 9, i: 8), s(r: 9, c: 9, b: 9, i: 9)
]

func printBoard() -> String {
    var finalBoard = ""
    for i in 0 ..< board.count {
        if i % 9 == 0 {
            finalBoard += "\n"
        }
        finalBoard += String(board[i].number) + " "
    }
    finalBoard += "\n"
    return finalBoard
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

class Board{
    let finalBoard = generateBoard()
    let squaresInfo = board
}
