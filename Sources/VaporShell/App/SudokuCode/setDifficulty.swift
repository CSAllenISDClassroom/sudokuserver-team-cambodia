import sudoku
import Vapor
import Foundation

func setDifficulty(difficulty: String) {
    func remove() {
        var completeBoard = String(printBoard())
        var string = ""
        for x in completeBoard {
            string.append(x)
        }
        print(string)
    }
    remove()
