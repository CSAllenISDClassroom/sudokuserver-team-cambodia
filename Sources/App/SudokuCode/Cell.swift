///////////////////////////////////////////////////////////////////////////////////////////////////////////
//This class maintains the variables necessary for associating the location of a cell with its value inside
///////////////////////////////////////////////////////////////////////////////////////////////////////////
class Cell {

    //Both the xCoordinate and the yCoordinate are private to ensure that the valueInCell is the only variale change at a certain cell location
    public var valueInCell : Int
    private let xCoordinate: Int
    private let yCoordinate: Int

    init(valueInCell: Int, xCoordinate: Int, yCoordinate: Int) {

        //Here the three variables have been initialized
        self.valueInCell = valueInCell
        self.xCoordinate = xCoordinate
        self.yCoordinate = yCoordinate
    }
    
}
