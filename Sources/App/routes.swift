import Vapor

var boardID = 0

func updateBoardID() {
    boardID += 1
}

func routes(_ app: Application) throws {
    app.get { req in
        return "It works! :D"
    }

    app.get("games") { req -> String in
        return "\(boardID)"
    }
}
