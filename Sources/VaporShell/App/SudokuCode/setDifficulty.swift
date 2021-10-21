//import sudoku
import Vapor
import Foundation

let sudoku = sudoku 
func removeNumbers(numbersToRemove:Int) {
//removes the numbers 
    for _ in  1...numbersToRemove {
        //removes a number at a random box Index adn cell index
        removeNumberFromSudokuBoard(columnIndex:Int.random(in(0..<9)), rowIndex: Int.random(in(0..<9))) 
        
    }

} 
func setDifficulty(difficulty: String) {
<<<<<<< HEAD
    func remove() {
        var completeBoard = String(printBoard())
        var string = ""
        for x in completeBoard {
            string.append(x)
        }
        print(string)
    }
    remove()
=======

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

func removeNumberFromSudokuBoard(columnIndex:Int,rowIndex: Int) {
//sodoku.board is the board made up of s classes 
    for s in  sudoku.board {
        if s.column == columnIndex && s.row == rowIndex  {

            s.number == nill 

        }
    }

} 
>>>>>>> b0bf89cda0fbc44792c19ff9f67b31b28fc8751a
