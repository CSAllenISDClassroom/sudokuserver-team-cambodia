import Vapor

struct ID : Content {
    var id : Int
}

class Game {
    var board : Board
    var shadowBoard : Board //change this later

    init(difficulty: String) {
        board = Board()
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


    app.post("games") { req -> String in 

        let encoder = JSONEncoder()

        guard let difficulty: String? = req.query["difficulty"]
        
        let game = Game(difficulty: difficulty)
        let id = latestBoardID.updateBoardID() //check if this works
        
        sudokuIDs[id] = game
        
        guard let data = try? encoder.encode(id),
              let string = String(data: data, encoding: .utf8) else {
            fatalError("Failed to encode ID to JSON")
        }
        
        return string
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //The GET command below allows the client to view the completed board of their specific game
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    app.get("games", ":id", "cells") { req -> ResponseData in

        //The variable id accesses the specific id for the client's requested board solution, which is represented by the variable, cells
        let id = req.parameters.get("id") ?? -1
        let cells = sudokuIDs[id] ?? Board()

        //This return statement responds to the client with the completed board with the server's statusCode as "200 OK"
        return ResponseData(action: "None", payload: "None", response: cells.finalBoard, statusCode: "200 OK")
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
