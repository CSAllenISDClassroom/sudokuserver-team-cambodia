////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//The class below creates a new board by randomly choosing values from 1...9 in order to create a solvable sudoku board
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



class sudokuBoard {
    
    public var board = [[Int]]()
    var box = [Int]()
    
    init() {
        
        for _ in 0 ... 8 {
            box.removeAll()
            
            for _ in 0 ... 8 {
                box.append(0)
            }
            board.append(box)
        }
        
    }
        func printBoard() -> String {
        var finalBoard = ""
        for i in 0 ..< board.count {
            for j in 0 ..< box.count {
                if i % 9 == 0 {
                    finalBoard += "\n"
                }
                finalBoard += String(board[i][j]) + " "
            }
        }
        finalBoard += "\n"
        return finalBoard
    }

    
}

// class s{
//     public var row : Int
//     public var column : Int
//     public var box : Int
//     public var cellIndex: Int
//     public var number = 0

//     init(r: Int, c: Int, b: Int, i: Int) {
//         self.row = r
//         self.column = c
//         self.box = b
//         self.cellIndex = i
//     }
// }


// var board = [s(r: 1, c: 1, b: 1, i: 1), s(r: 1, c: 2, b: 1, i: 2), s(r: 1, c: 3, b: 1, i: 3), s(r: 1, c: 4, b: 2, i: 1), s(r: 1, c: 5, b: 2, i: 2), s(r: 1, c: 6, b: 2, i: 3), s(r: 1, c: 7, b: 3, i: 1), s(r: 1, c: 8, b: 3, i: 2), s(r: 1, c: 9, b: 3, i: 3),
//              s(r: 2, c: 1, b: 1, i: 4), s(r: 2, c: 2, b: 1, i: 5), s(r: 2, c: 3, b: 1, i: 6), s(r: 2, c: 4, b: 2, i: 4), s(r: 2, c: 5, b: 2, i: 5), s(r: 2, c: 6, b: 2, i: 6), s(r: 2, c: 7, b: 3, i: 4), s(r: 2, c: 8, b: 3, i: 5), s(r: 2, c: 9, b: 3, i: 6),
//              s(r: 3, c: 1, b: 1, i: 7), s(r: 3, c: 2, b: 1, i: 8), s(r: 3, c: 3, b: 1, i: 9), s(r: 3, c: 4, b: 2, i: 7), s(r: 3, c: 5, b: 2, i: 8), s(r: 3, c: 6, b: 2, i: 9), s(r: 3, c: 7, b: 3, i: 7), s(r: 3, c: 8, b: 3, i: 8), s(r: 3, c: 9, b: 3, i: 9),

//              s(r: 4, c: 1, b: 4, i: 1), s(r: 4, c: 2, b: 4, i: 2), s(r: 4, c: 3, b: 4, i: 3), s(r: 4, c: 4, b: 5, i: 1), s(r: 4, c: 5, b: 5, i: 2), s(r: 4, c: 6, b: 5, i: 3), s(r: 4, c: 7, b: 6, i: 1), s(r: 4, c: 8, b: 6, i: 2), s(r: 4, c: 9, b: 6, i: 3),
//              s(r: 5, c: 1, b: 4, i: 4), s(r: 5, c: 2, b: 4, i: 5), s(r: 5, c: 3, b: 4, i: 6), s(r: 5, c: 4, b: 5, i: 4), s(r: 5, c: 5, b: 5, i: 5), s(r: 5, c: 6, b: 5, i: 6), s(r: 5, c: 7, b: 6, i: 4), s(r: 5, c: 8, b: 6, i: 5), s(r: 5, c: 9, b: 6, i: 6),
//              s(r: 6, c: 1, b: 4, i: 7), s(r: 6, c: 2, b: 4, i: 8), s(r: 6, c: 3, b: 4, i: 9), s(r: 6, c: 4, b: 5, i: 7), s(r: 6, c: 5, b: 5, i: 8), s(r: 6, c: 6, b: 5, i: 9), s(r: 6, c: 7, b: 6, i: 7), s(r: 6, c: 8, b: 6, i: 8), s(r: 6, c: 9, b: 6, i: 9),

//              s(r: 7, c: 1, b: 7, i: 1), s(r: 7, c: 2, b: 7, i: 2), s(r: 7, c: 3, b: 7, i: 3), s(r: 7, c: 4, b: 8, i: 1), s(r: 7, c: 5, b: 8, i: 2), s(r: 7, c: 6, b: 8, i: 3), s(r: 7, c: 7, b: 9, i: 1), s(r: 7, c: 8, b: 9, i: 2), s(r: 7, c: 9, b: 9, i: 3),
//              s(r: 8, c: 1, b: 7, i: 4), s(r: 8, c: 2, b: 7, i: 5), s(r: 8, c: 3, b: 7, i: 6), s(r: 8, c: 4, b: 8, i: 4), s(r: 8, c: 5, b: 8, i: 5), s(r: 8, c: 6, b: 8, i: 6), s(r: 8, c: 7, b: 9, i: 4), s(r: 8, c: 8, b: 9, i: 5), s(r: 8, c: 9, b: 9, i: 6),
//              s(r: 9, c: 1, b: 7, i: 7), s(r: 9, c: 2, b: 7, i: 8), s(r: 9, c: 3, b: 7, i: 9), s(r: 9, c: 4, b: 8, i: 7), s(r: 9, c: 5, b: 8, i: 8), s(r: 9, c: 6, b: 8, i: 9), s(r: 9, c: 7, b: 9, i: 7), s(r: 9, c: 8, b: 9, i: 8), s(r: 9, c: 9, b: 9, i: 9)
// ]

// func printBoard() -> String {
//     var finalBoard = ""
//     for i in 0 ..< board.count {
//         if i % 9 == 0 {
//             finalBoard += "\n"
//         }
//         finalBoard += String(board[i].number) + " "
//     }
//     finalBoard += "\n"
//     return finalBoard
// }



// func checkRow(rowNum: Int, number: Int) -> Bool{

//     for square in board {
//         if square.row == rowNum && square.number == number{
//             return false
//         }
//     }

//     return true
// }

// func checkColumn(columnNum: Int, number: Int) -> Bool{

//     for square in board {
//         if square.column == columnNum && square.number == number{
//             return false
//         }
//     }

//     return true
// }

// func checkBox(boxNum: Int, number: Int) -> Bool {
//     for square in board {
//         if square.box == boxNum && square.number == number{
//             return false
//         }
//     }

//     return true
// }

// func getIndexesOfBox(boxNum: Int) -> [Int] {
//     var indexes = [Int]()

//     for i in 0 ..< board.count {
//         if board[i].box == boxNum {
//             indexes.append(i)
//         }
//     }

//     return indexes
// }

// func removeNum(number : Int) {
//     for i in 0 ..< board.count {
//         if board[i].number == number {
//             board[i].number = 0
//         }
//     }
// }

// func placeNum(boxNum : Int, number : Int){
//     let indexesOfBox = getIndexesOfBox(boxNum : boxNum)
//     for _ in 1 ... 100 {
//         let randomIndex = indexesOfBox[Int.random(in: 0 ..< indexesOfBox.count)]
//         if board[randomIndex].number == 0 && checkRow(rowNum : board[randomIndex].row, number : number) && checkColumn(columnNum : board[randomIndex].column, number : number) && checkBox(boxNum: board[randomIndex].box, number : number) {
//             board[randomIndex].number = number
//             break
//         }
//     }
// }

// func generateBoard(difficulty: Int) -> String {
//     var isComplete = false
//     var numsZero = 0
    
//     while !isComplete {
//         for box in 1 ... 9 {
//             for num in 1 ... 9 {
//                 placeNum(boxNum : box, number : num)
//             }
//         }
        
//         for square in board {
//             if square.number == 0 {
//                 numsZero += 1
//             }
//         }
        
//         if numsZero == 0 {
//             isComplete = true
//         } else {
//             numsZero = 0
//             for num in 1 ... 9 {
//                 removeNum(number: num)
//             }
//         }
//     }

//     for _ in 1 ... difficulty * 7 {
        
//         let randomIndex = Int.random(in: 0 ..< 81)
        
//         board[randomIndex].number = 0
//     }
    
//     return printBoard()
// }

// class Board{
//     let finalBoard = generateBoard(difficulty: 3)
//     let squaresInfo = board
// }
