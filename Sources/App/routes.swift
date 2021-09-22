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
var sudokuIDs = [Int:Board]()

var latestBoardID = 0

func updateBoardID() -> Int{
    latestBoardID += 1
    return latestBoardID
}


func routes(_ app: Application) throws {
    app.get { req in
        return "vapor my beloved"
    }

    app.post("games") { req -> ResponseData in 
        let board = Board()
        let id = updateBoardID()

        sudokuIDs[id] = board
        
        return ResponseData(action: "Created Game", payload: "None", response: "\(id)", statusCode: "201 Created")  
    }
    
    app.get("games", ":id", "cells") { req -> ResponseData in
        let id = req.parameters.get("id") ?? -1
        let cells = sudokuIDs[id] ?? Board()
        return ResponseData(action: "None", payload: "None", response: cells.finalBoard, statusCode: "200 OK")
    }

    app.put("games", ":id", "cells", ":boxIndex", ":cellIndex") { req -> ResponseData in
        let id = req.parameters.get("id") ?? -1
        let boardArray = sudokuIDs[id]?.squaresInfo ?? Board().squaresInfo
        let boxIndex = req.parameters.get("boxIndex") ?? -1
        let cellIndex = req.parameters.get("cellIndex") ?? -1

        for s in boardArray {
            if s.box == boxIndex && s.cellIndex == cellIndex {
                s.number = -1 //what do we set the number to??
            }
        }
        
        return ResponseData(action: "Placed value in boxIndex, cellIndex", payload: "number??", response: "Nothing", statusCode: "204 No content") //number??
    }
}
