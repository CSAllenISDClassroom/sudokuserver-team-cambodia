import Vapor
/*
class s{
    public var row : Int
    public var column : Int
    public var box : Int
    public var number = 0

    init(r: Int, c: Int, b: Int) {
        self.row = r
        self.column = c
        self.box = b
    }
}

var board = [s(r: 1, c: 1, b: 1), s(r: 1, c: 2, b: 1), s(r: 1, c: 3, b: 1), s(r: 1, c: 4, b: 2), s(r: 1, c: 5, b: 2), s(r: 1, c: 6, b: 2), s(r: 1, c: 7, b: 3), s(r: 1, c: 8, b: 3), s(r: 1, c: 9, b: 3),
             s(r: 2, c: 1, b: 1), s(r: 2, c: 2, b: 1), s(r: 2, c: 3, b: 1), s(r: 2, c: 4, b: 2), s(r: 2, c: 5, b: 2), s(r: 2, c: 6, b: 2), s(r: 2, c: 7, b: 3), s(r: 2, c: 8, b: 3), s(r: 2, c: 9, b: 3),
             s(r: 3, c: 1, b: 1), s(r: 3, c: 2, b: 1), s(r: 3, c: 3, b: 1), s(r: 3, c: 4, b: 2), s(r: 3, c: 5, b: 2), s(r: 3, c: 6, b: 2), s(r: 3, c: 7, b: 3), s(r: 3, c: 8, b: 3), s(r: 3, c: 9, b: 3),

             s(r: 4, c: 1, b: 4), s(r: 4, c: 2, b: 4), s(r: 4, c: 3, b: 4), s(r: 4, c: 4, b: 5), s(r: 4, c: 5, b: 5), s(r: 4, c: 6, b: 5), s(r: 4, c: 7, b: 6), s(r: 4, c: 8, b: 6), s(r: 4, c: 9, b: 6),
             s(r: 5, c: 1, b: 4), s(r: 5, c: 2, b: 4), s(r: 5, c: 3, b: 4), s(r: 5, c: 4, b: 5), s(r: 5, c: 5, b: 5), s(r: 5, c: 6, b: 5), s(r: 5, c: 7, b: 6), s(r: 5, c: 8, b: 6), s(r: 5, c: 9, b: 6),
             s(r: 6, c: 1, b: 4), s(r: 6, c: 2, b: 4), s(r: 6, c: 3, b: 4), s(r: 6, c: 4, b: 5), s(r: 6, c: 5, b: 5), s(r: 6, c: 6, b: 5), s(r: 6, c: 7, b: 6), s(r: 6, c: 8, b: 6), s(r: 6, c: 9, b: 6),

             s(r: 7, c: 1, b: 7), s(r: 7, c: 2, b: 7), s(r: 7, c: 3, b: 7), s(r: 7, c: 4, b: 8), s(r: 7, c: 5, b: 8), s(r: 7, c: 6, b: 8), s(r: 7, c: 7, b: 9), s(r: 7, c: 8, b: 9), s(r: 7, c: 9, b: 9),
             s(r: 8, c: 1, b: 7), s(r: 8, c: 2, b: 7), s(r: 8, c: 3, b: 7), s(r: 8, c: 4, b: 8), s(r: 8, c: 5, b: 8), s(r: 8, c: 6, b: 8), s(r: 8, c: 7, b: 9), s(r: 8, c: 8, b: 9), s(r: 8, c: 9, b: 9),
             s(r: 9, c: 1, b: 7), s(r: 9, c: 2, b: 7), s(r: 9, c: 3, b: 7), s(r: 9, c: 4, b: 8), s(r: 9, c: 5, b: 8), s(r: 9, c: 6, b: 8), s(r: 9, c: 7, b: 9), s(r: 9, c: 8, b: 9), s(r: 9, c: 9, b: 9)
]

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
    var indexesOfBox = getIndexesOfBox(boxNum : boxNum)
    var placedNumOnBoard = false
    for _ in 1 ... 100 {
        var randomIndex = indexesOfBox[Int.random(in: 0 ..< indexesOfBox.count)]
        if board[randomIndex].number == 0 && checkRow(rowNum : board[randomIndex].row, number : number) && checkColumn(columnNum : board[randomIndex].column, number : number) && checkBox(boxNum: board[randomIndex].box, number : number) {
            board[randomIndex].number = number
            placedNumOnBoard = true
            return true
            break
        }
    }

    if !placedNumOnBoard {
        return false
    }
}


func generateBoard() -> [[Int]] {


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

    //turn it into a 2d array
    var twoDBoard = [[Int]]()
    for s in 0 ..< board.count {
        for box in 0 ..< 9 {
            let emptyArray = [Int]()
            twoDBoard.append(emptyArray)
            if s/9 == box {
                twoDBoard[box].append(board[s].number)
            }
        }
    }
    return twoDBoard
}
*/
func correctBoardValues() {
    var testBoard = generateBoard()
    //print(testBoard)

    for boxes in 0 ..< 3 {
        for boxIndex in 0 ..< 3 {
            for cellIndex in 0 ..< 3 {
                print(testBoard[boxIndex][cellIndex + (boxes * 3)], terminator:"")
            }
        }
        print()
    }

    for boxes in 0 ..< 3 {
        for boxIndex in 3 ..< 6 {
            for cellIndex in 0 ..< 3 {
                print(testBoard[boxIndex][cellIndex + (boxes * 3)], terminator:"")
            }
        }
        print()
    }

    for boxes in 0 ..< 3 {
        for boxIndex in 6 ..< 9 {
            for cellIndex in 0 ..< 3 {
                print(testBoard[boxIndex][cellIndex + (boxes * 3)], terminator:"")
            }
        }
        print()
    }
}

func repeatedValues(Board:[[Int]]) {
    var repeatedValuesBoard = Board
    for boxes in Board {
        for boxIndex in 0 ..< 9 {
            for cellIndex in 0 ..< 9 {
                let x = boxIndex
                let duplicates = Array(Set(x.filter({ (i: Int) in x.filter({ $0 == i }).count > 1})))
                if duplicates.count > 1 {
                    repeatedValuesBoard.append(duplicates)
                }
            }
        }
    }
    print(repeatedValuesBoard)
}

func incorrectValues(Board:[[Int]]) {
    var correctValues = generateBoard()
    var incorrectValues = [[Int]]()
    for boxes in correctValues {
        for boxIndex in 0 ..< 3 {
            for cellIndex in 0 ..< 3 {
                
            }
        }
    }
}

func Filter(Filter: String, Board:[[Int]]) -> [[Int]] {

 var specifiedFilter = Filter

 switch specifiedFilter {

 case "all":

 return allBoardValues()

 case "repeated":

     return repeatedBoardValues(Board:Board)

 case "incorrect":

 return incorrectBoardValues()

 default :

 specifiedFilter = "all"
 }

 }
 
