import Vapor

struct Background : Content {
    var action : String
    var payload : String
    var response : String
    var statusCode : String
}

struct SudokuBoard: Content {
    var board: String
}

func routes(_ app: Application) throws {
    var board : String
    app.get { req in
        return "It works!"
    }

    app.get("games") { req -> String in
        return "\(boardID)"
    }

    //    app.post("games") { req in
    
    //    }

    app.get("games", ":id", "cells") { req -> SudokuBoard in
        let board = SudokuBoard(board: generateBoard())
        return board
    }
    
}
