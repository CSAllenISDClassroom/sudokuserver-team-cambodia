import Vapor

//the board generated which has the full solution for the playerBoard
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

//This function takes care of filtering out the repeatedValues in the playerBoard
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

//This function takes care of filtering out the incorrectValues in the playerBoard compared to the correctBoardvalues
func incorrectValues(Board:[[Int]]) {
    var correctValues = generateBoard()
    var incorrectValues = [[Int]]()
    for boxes in correctValues {
        for boxIndex in 0 ..< 3 {
            for cellIndex in 0 ..< 3 {
                //go through the values of the correct board and see if any values (not including the blank cells) are not matching with the playerBoard
            }
        }
    }
}

//Still work in progress 
func allBoardValues() {
    //need to find out how to access player board
    print(playerBoard)
}


func getFilter(Filter:String, Board:[[Int]]) {
    Filter(Filter:Filter, Board:Board)
}

//using switch case structure to organize available filters 
func Filter(Filter: String, Board:[[Int]]) {

    var specifiedFilter = Filter

    switch specifiedFilter {

    case "all":

         allBoardValues()

    case "repeated":

         repeatedBoardValues(Board:Board)

    case "incorrect":

         incorrectBoardValues()

    default :

        specifiedFilter = "all"
    }

}
