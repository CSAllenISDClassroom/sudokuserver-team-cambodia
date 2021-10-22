//import sudoku
import Vapor
import Foundation

let sudoku = sudoku 

func removeNumberFromSudokuBoard(columnIndex:Int,rowIndex: Int) {
//sodoku.board is the board made up of s classes 
    for s in  sudoku.board {
        if s.column == columnIndex && s.row == rowIndex  {

            s.number == nill 

        }
    }

} 

func removeNumbers(numbersToRemove:Int) {
//removes the numbers 
    for _ in  1...numbersToRemove {
        removes a number at a random box Index adn cell index
        removeNumberFromSudokuBoard(columnIndex:(Int.random(in(0 ..< 9))), rowIndex: Int.random(in(0..<9))) 
        
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

