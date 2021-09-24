class Row {
    // A Row is a horizontal collection of cells, 9 cells long
    public var cells : [Cell]
    init(cellsArray: Array) {
        precondition(cellsArray.count == 9, "An attempt was made to initialize a row without 9 cells")
    }
}
