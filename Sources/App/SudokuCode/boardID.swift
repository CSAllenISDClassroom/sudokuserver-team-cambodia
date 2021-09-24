/////////////////////////////////////////////////////////////////////////////////////////////////////////
//This class allows the boardID to persist with a specific game as an instance of the class boardID below
/////////////////////////////////////////////////////////////////////////////////////////////////////////
class boardID {
    private static var latestBoardID = -1

    //This function will be invoked in order to create a new boardID when requested by the client in routes.swift
    public func updateBoardID() -> Int {
        boardID.latestBoardID += 1
        return boardID.latestBoardID
    }
}
