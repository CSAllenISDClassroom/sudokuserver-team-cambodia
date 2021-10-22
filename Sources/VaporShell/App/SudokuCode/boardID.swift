/////////////////////////////////////////////////////////////////////////////////////////////////////////
//This class allows the boardID to persist with a specific game as an instance of the class boardID below
/////////////////////////////////////////////////////////////////////////////////////////////////////////
class boardID {
    private var boardIDs = [Int]()
    private var latestBoardID = -1

    //This function will be invoked in order to create a new boardID when requested by the client in routes.swift
    public func updateBoardID() -> Int {
        let possibleBoardID = Int.random(in: 0...1000000)
        var idIsNotValid = true // Assumes that the id is not valid at first

        repeat {
            for ID in boardIDs {
                if ID == possibleBoardID {
                    idIsNotValid = false
                    break
                }
            }
        } while idIsNotValid

        boardIDs.append(possibleBoardID)
        latestBoardID = possibleBoardID
        return possibleBoardID
    }
}
