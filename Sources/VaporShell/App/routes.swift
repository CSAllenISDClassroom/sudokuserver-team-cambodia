import Vapor

struct ID : Content {
    var id : Int
}

class Game {
    var sudokuBoard : SudokuBoard
    
        init(difficulty: String) {
        let newSudokuBoard = SudokuBoard(difficulty:difficulty)
        self.sudokuBoard = newSudokuBoard
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

        guard let cells = sudokuIDs[intID] else { //is this correct?
            throw Abort(.badRequest, reason: "invalid ID")
        }
        
        if filter != "all" && filter != "repeated" && filter != "incorrect" {
            throw Abort(.badRequest, reason: "invalid filter")
        }

        //////////////////////////////////
        //use the filter function with cells.shadowboard to have a variable with the filtered code
        //////////////////////////////////

        let filteredBoard = cells.sudokuBoard.filter(filter:filter, solutionBoard: cells.sudokuBoard.solutionBoard)

        print(filteredBoard!)
        
       //This return statement responds to the client with the completed board with the server's statusCode as "200 OK"
        return Response(status: .ok)
    }

    app.put("games", ":id", "cells", ":boxIndex", ":cellIndex") { req -> Response in

        guard let id  = req.parameters.get("id"),
              let intID = Int(id) else {
            throw Abort(.badRequest, reason: "invalid ID")
        }

        guard let cells = sudokuIDs[intID] else { //is this correct?
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
        
        struct CellValue: Decodable {
            let value: Int?
        }
        
        let cellValue = try req.content.decode(CellValue.self)
        
        
        guard cellValue.value == nil || (1 ... 9).contains(cellValue.value!) else {
             throw Abort(.badRequest, reason: "value is out of range 1 ... 9 or null")
        }
        
        cells.sudokuBoard.changeValueInBoard(boxIndex: Int(boxIndex)!, cellIndex: Int(cellIndex)!, newValue: cellValue.value)

        //This return statement communicates to the client whether or not their requested value has been placed in the boxIndex and cellIndex
        return Response(status: .ok, body :"")
    }
}
