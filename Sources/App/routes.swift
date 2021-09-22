import Vapor

struct Background : Content {
    var action : String
    var payload : String
    var response : String
    var statusCode : String
    var userBoardID : Int
}

var latestBoardID = 0 //latest generated boardID
//var temporaryUserBoardID = 0

func updateBoardID() {
    latestBoardID += 1
}

struct SudokuBoard: Content {
    var board: String
}

func routes(_ app: Application) throws {
<<<<<<< HEAD
=======

>>>>>>> 45bae07b6798bca16a7c83813e26e88b45631a21
    app.get { req in
        return "It works!"
    }

    app.post("hersh") { req -> Int in
        updateBoardID()
        return latestBoardID
    }


    app.get("hershlol") { req -> String in
        return "\(latestBoardID)"
    }

//    app.get("games", ":id", "cells") { req -> SudokuBoard in
//        let board = SudokuBoard(board: generateBoard())
//        return board
//    }
    
}
