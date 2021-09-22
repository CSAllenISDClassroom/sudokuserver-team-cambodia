class boardID {
    private static var latestBoardID = -1
    
    public func updateBoardID() -> Int {
        boardID.latestBoardID += 1
        return boardID.latestBoardID
    }
}
