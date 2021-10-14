import Vapor

struct Cell: Content {
    let position: Position
    let value: Int?
}
