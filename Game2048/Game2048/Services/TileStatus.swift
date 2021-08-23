//
//  TileStatus.swift
//  Game2048
//
//  Created by Swathi on 22/08/21.
//

import Foundation

///This class maintains the tile values and status
class TileStatus {
    var tile1: Int = 0
    var tile2: Int = 0
    var tile3: Int = 0
    var tile4: Int = 0
    var tile5: Int = 0
    var tile6: Int = 0
    var tile7: Int = 0
    var tile8: Int = 0
    var tile9: Int = 0
    var tile10: Int = 0
    var tile11: Int = 0
    var tile12: Int = 0
    var tile13: Int = 0
    var tile14: Int = 0
    var tile15: Int = 0
    var tile16: Int = 0
    
    //This array maintains the tiles status - false is empty tile. True is tile has some number
    var tileStatusArray: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    
    static var shared: TileStatus = TileStatus()
    
    ///Returns the list of empty tiles based on the tileStatusArray values
    public func getEmptyTileList() -> [Int] {
        var emptyTiles = [Int]()
        for i in 0..<tileStatusArray.count {
            if !tileStatusArray[i] {
                emptyTiles.append(i+1)
            }
        }
        return emptyTiles
    }
    
    ///Resets the Tile values and their status to the original state
    public func resetStatus() {
        self.tileStatusArray = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
        self.tile1 = 0
        self.tile2 = 0
        self.tile3 = 0
        self.tile4 = 0
        self.tile5 = 0
        self.tile6 = 0
        self.tile7 = 0
        self.tile8 = 0
        self.tile9 = 0
        self.tile10 = 0
        self.tile11 = 0
        self.tile12 = 0
        self.tile13 = 0
        self.tile14 = 0
        self.tile15 = 0
        self.tile16 = 0
    }
}
