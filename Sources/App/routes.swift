import Vapor

struct SudokuBoard: Content {
    var board: String
    var boardID: Int
}

struct ResponseData : Content{
    
    var action : String
    var payload : String
    var response : String
    var statusCode : String

}
var sudokuIDs = [Int:String]()

var latestBoardID = 0

func updateBoardID() -> Int{
    latestBoardID += 1
    return latestBoardID
}


func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.post("games") { req -> ResponseData in 
        let board = Board()
        let id = updateBoardID()

        sudokuIDs[id] = board.board
        
        return ResponseData(action: "Created Game", payload: "None", response: "\(id)", statusCode: "201 Created")  
    }
    
    app.get("games", ":id", "cells") { req -> ResponseData in
        let id = req.parameters.get("id") ?? -1
        let cells = sudokuIDs[id] ?? "error"
        return ResponseData(action: "None", payload: "None", response: cells, statusCode: "200 OK")
    }
    
    
    //???
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
