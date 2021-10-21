import Vapor

struct ID : Content {
    var id : Int
}

class Game {
    var playerBoard : Board
    var shadowBoard : Board //change this later

    init(difficulty: String) {
        playerBoard = Board()
        shadowBoard = Board() //change this later
    }
}


func routes(_ app: Application) throws {
    var sudokuIDs = [Int: Game]()
    let latestBoardID = boardID()
    
    //making peace with vapor
    app.get { req in
        return "vapor my beloved"
    }


    app.post("games") { req -> Response in 

        //verifies difficulty 
        guard let difficulty: String = req.query["difficulty"] else {
            throw Abort(.badRequest, reason: "difficulty not provided")
        }

        if difficulty != "easy" && difficulty != "medium" && difficulty != "hard" && difficulty != "hell" {
            throw Abort(.badRequest, reason: "invalid difficulty")
        }

        //makes variables for the game
        let game = Game(difficulty: difficulty) //am i allowed to bang here?
        let id = latestBoardID.updateBoardID() //check if this works
        
        sudokuIDs[id] = game

        //encoding data to be returned
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(id),
              let string = String(data: data, encoding: .utf8) else {
            throw Abort(.badRequest, reason: "Failed to encode ID to JSON")
        }

        return Response(status: .created) //is this correct? 
    }
    
    app.get("games", ":id", "cells") { req -> Response in

        guard let filter: String = req.query["filter"] else {
            throw Abort(.badRequest, reason: "filter not provided")
        }

        guard let id  = req.parameters.get("id"),
              let intID = Int(id) else {
            throw Abort(.badRequest, reason: "invalid ID")
        }

        guard let cells = try? sudokuIDs[intID] else { //is this correct?
            throw Abort(.badRequest, reason: "invalid ID")
        }
        
        if filter != "all" && filter != "repeated" && filter != "incorrect" {
            throw Abort(.badRequest, reason: "invalid filter")
        }

        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(cells.playerBoard), //encoder.encode(cells.playerBoard.filter(filter: filter))
              let string = String(data: data, encoding: .utf8) else {
            throw Abort(.badRequest, reason: "Failed to encode playerBoard to JSON")
        }

        //This return statement responds to the client with the completed board with the server's statusCode as "200 OK"
        return Response(status: .ok)
    }

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //The PUT command below allows the client to place a specific value at a specified cell on their board
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    app.put("games", ":id", "cells", ":boxIndex", ":cellIndex") { req -> ResponseData in

        //The variable id requests to retrieve a particular boardID for a the specific game being played by the client
        let id = req.parameters.get("id") ?? -1

        //The boardArray has the cell values of a completed board with the boxIndex and the cellIndex specifying the location of a requested cell
        let boardArray = sudokuIDs[id]?.squaresInfo ?? Board().squaresInfo
        let boxIndex = req.parameters.get("boxIndex") ?? -1
        let cellIndex = req.parameters.get("cellIndex") ?? -1

        //This loop goes through the contents of boardArray to find the value of a specific cell that matches the requested boxIndex and cellIndex
        for square in boardArray {
            if square.box == boxIndex && square.cellIndex == cellIndex {
                square.number = -1 //what do we set the number to??
            }
        }

        //This return statement communicates to the client whether or not their requested value has been placed in the boxIndex and cellIndex
        return ResponseData(action: "Placed value in boxIndex, cellIndex", payload: "number??", response: "Nothing", statusCode: "204 No content") //number??
    }
}
