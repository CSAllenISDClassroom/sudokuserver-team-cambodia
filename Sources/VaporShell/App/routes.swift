import Vapor

struct ID : Content {
    var id : Int
}

class Game {
    var playerBoard : Board
    var shadowBoard : Board 

    init(difficulty: String) {
        playerBoard = Board() //add difficulty parameter later
        shadowBoard = Board() 
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
        let game = Game(difficulty: difficulty) //am i allowed to bang here? dont laugh
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
        getFilter(Filter:filter, Board:playerBoard)
        
       //This return statement responds to the client with the completed board with the server's statusCode as "200 OK"
        return ResponseData(action: "None", payload: "None", response: cells.finalBoard, statusCode: "200 OK")
    }

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //The PUT command below allows the client to place a specific value at a specified cell on their board
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    app.put("games", ":id", "cells", ":boxIndex", ":cellIndex") { req -> Response in

        guard let id  = req.parameters.get("id"),
              let intID = Int(id) else {
            throw Abort(.badRequest, reason: "invalid ID")
        }

        guard let cells = try? sudokuIDs[intID] else { //is this correct?
            throw Abort(.badRequest, reason: "invalid ID")
        }

        guard let boxIndex  = req.parameters.get("boxIndex"),
              let intBoxIndex = Int(boxIndex) else {
            throw Abort(.badRequest, reason: "invalid input given for boxIndex")
        }

        guard let cellIndex  = req.parameters.get("cellIndex"),
              let intCellIndex = Int(cellIndex) else {
            throw Abort(.badRequest, reason: "invalid input given for cellIndex")
        }

        if intBoxIndex > 8 || intBoxIndex < 0 {
            throw Abort(.badRequest, reason: "boxIndex is out of range 0 ... 8")
        }

        if intCellIndex > 8 || intCellIndex < 0 {
            throw Abort(.badRequest, reason: "cellIndex is out of range 0 ... 8")
        }

        //how do i get user input??

        //This return statement communicates to the client whether or not their requested value has been placed in the boxIndex and cellIndex
        return Response(status: .ok, body :"")
    }
}
