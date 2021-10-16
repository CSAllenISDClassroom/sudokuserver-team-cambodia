import Vapor

struct Board2: Content {
    let board: [Box]

    init() {
        var board = [Box]()
        for boxIndex in 0 ..< 9 {
            board.append(Box(boxIndex: boxIndex))
        }
        self.board = board
    }
}
