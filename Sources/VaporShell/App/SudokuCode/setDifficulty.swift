//import sudoku
import Vapor
import Foundation

func removeNumberFromSudokuBoard(columnIndex:Int,rowIndex: Int) {
//sodoku.board is the board made up of s classes 
    for i in SudokuBoard.board {
        if SudokuBoard.board[i].column == columnIndex && SudokuBoard.board[i].row == rowIndex  {
            
            s.number == nil

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

