import sudoku
import Vapor
import Foundation

func removeNumbers(numbersToRemove:Int) {
//removes the numbers 
    for number in  1...numbersToRemove {
        //removes a number at a random box Index adn cell index
        removeNumberFromSudokuBoard(boxIndex:Int.random(in(0..<9)), cellIndex: Int.random(in(0..<9))) 
        
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

func removeNumberFromSucokuBoard(boxIndex:Int,cellIndex: Int) {


} 
