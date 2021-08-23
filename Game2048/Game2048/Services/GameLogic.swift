//
//  GameLogic.swift
//  Game2048
//
//  Created by Swathi on 22/08/21.
//

import Foundation

///User can move in 4 Directions
enum Direction {
    case right
    case left
    case up
    case down
}

class GameLogic {
    
    static var shared: GameLogic = GameLogic()
    
    ///This function generates a random empty tile based on the available list of empty tiles.
    ///The tile generated here is used for inserting next random number
    public func getRandomEmptyTile() -> Int {
        let emptyTileList = TileStatus.shared.getEmptyTileList()
        if emptyTileList.isEmpty {
            return 0
        }
        let randomIndex = Int(arc4random_uniform(UInt32(emptyTileList.count)))
        return emptyTileList[randomIndex]
    }
    
    ///We are generating a random Bool value.
    ///If the value is true, the next random tile inserted will be 2
    ///If the value is false, the next random tile inserted will be 4
    public func getNextRandomNumber() -> String {
        return Bool.random() == true ? "2" : "4"
    }
    
    ///This function shifts the tiles in the direction of the swipe made by user
    public func shiftTile(direction: Direction) -> Int {
        var tileList1 = [Int]()
        var tileList2 = [Int]()
        var tileList3 = [Int]()
        var tileList4 = [Int]()
        var score = 0
        
        //Make a list of tiles in each row/column based on swipe direction
        switch direction {
            case .right:
                tileList1 = [TileStatus.shared.tile4, TileStatus.shared.tile3, TileStatus.shared.tile2, TileStatus.shared.tile1]
                tileList2 = [TileStatus.shared.tile8, TileStatus.shared.tile7, TileStatus.shared.tile6, TileStatus.shared.tile5]
                tileList3 = [TileStatus.shared.tile12, TileStatus.shared.tile11, TileStatus.shared.tile10, TileStatus.shared.tile9]
                tileList4 = [TileStatus.shared.tile16, TileStatus.shared.tile15, TileStatus.shared.tile14, TileStatus.shared.tile13]
                break
            case .left:
                tileList1 = [TileStatus.shared.tile1, TileStatus.shared.tile2, TileStatus.shared.tile3, TileStatus.shared.tile4]
                tileList2 = [TileStatus.shared.tile5, TileStatus.shared.tile6, TileStatus.shared.tile7, TileStatus.shared.tile8]
                tileList3 = [TileStatus.shared.tile9, TileStatus.shared.tile10, TileStatus.shared.tile11, TileStatus.shared.tile12]
                tileList4 = [TileStatus.shared.tile13, TileStatus.shared.tile14, TileStatus.shared.tile15, TileStatus.shared.tile16]
                break
            case .up:
                tileList1 = [TileStatus.shared.tile1, TileStatus.shared.tile5, TileStatus.shared.tile9, TileStatus.shared.tile13]
                tileList2 = [TileStatus.shared.tile2, TileStatus.shared.tile6, TileStatus.shared.tile10, TileStatus.shared.tile14]
                tileList3 = [TileStatus.shared.tile3, TileStatus.shared.tile7, TileStatus.shared.tile11, TileStatus.shared.tile15]
                tileList4 = [TileStatus.shared.tile4, TileStatus.shared.tile8, TileStatus.shared.tile12, TileStatus.shared.tile16]
                break
            case .down:
                tileList1 = [TileStatus.shared.tile13, TileStatus.shared.tile9, TileStatus.shared.tile5, TileStatus.shared.tile1]
                tileList2 = [TileStatus.shared.tile14, TileStatus.shared.tile10, TileStatus.shared.tile6, TileStatus.shared.tile2]
                tileList3 = [TileStatus.shared.tile15, TileStatus.shared.tile11, TileStatus.shared.tile7, TileStatus.shared.tile3]
                tileList4 = [TileStatus.shared.tile16, TileStatus.shared.tile12, TileStatus.shared.tile8, TileStatus.shared.tile4]
                break
        }
        
        //Shift the zeroes to the end of the arrays.
        //This is a preparation step done before adding the adjacent tiles
        (tileList1, tileList2, tileList3, tileList4) = self.shiftZeroesToEnd(list1: tileList1, list2: tileList2, list3: tileList3, list4: tileList4)
        
        //Adding adjacent tiles with same values
        //When two tiles are added, keep the sum in 1st tile and 0 in 2nd tile.
        //This avoids adding the same tile twice
        //Also add the sum to the score
        for i in 0..<3 {
            if tileList1[i] == tileList1[i+1] {
                let sum = tileList1[i] + tileList1[i+1]
                tileList1[i] = sum
                tileList1[i+1] = 0
                score = score + sum
            }
            
            if tileList2[i] == tileList2[i+1] {
                let sum = tileList2[i] + tileList2[i+1]
                tileList2[i] = sum
                tileList2[i+1] = 0
                score = score + sum
            }
            
            if tileList3[i] == tileList3[i+1] {
                let sum = tileList3[i] + tileList3[i+1]
                tileList3[i] = sum
                tileList3[i+1] = 0
                score = score + sum
            }
            
            if tileList4[i] == tileList4[i+1] {
                let sum =  tileList4[i] + tileList4[i+1]
                tileList4[i] = sum
                tileList4[i+1] = 0
                score = score + sum
            }
        }
        
        //Shift the zeroes obtained during addition to the end of the arrays
        (tileList1, tileList2, tileList3, tileList4) = self.shiftZeroesToEnd(list1: tileList1, list2: tileList2, list3: tileList3, list4: tileList4)
        
        //Update the Tile values in the TileStatus class
        switch direction {
            case .right:
                TileStatus.shared.tile4 = tileList1[0]
                TileStatus.shared.tile3 = tileList1[1]
                TileStatus.shared.tile2 = tileList1[2]
                TileStatus.shared.tile1 = tileList1[3]
                TileStatus.shared.tile8 = tileList2[0]
                TileStatus.shared.tile7 = tileList2[1]
                TileStatus.shared.tile6 = tileList2[2]
                TileStatus.shared.tile5 = tileList2[3]
                TileStatus.shared.tile12 = tileList3[0]
                TileStatus.shared.tile11 = tileList3[1]
                TileStatus.shared.tile10 = tileList3[2]
                TileStatus.shared.tile9 = tileList3[3]
                TileStatus.shared.tile16 = tileList4[0]
                TileStatus.shared.tile15 = tileList4[1]
                TileStatus.shared.tile14 = tileList4[2]
                TileStatus.shared.tile13 = tileList4[3]
                break
            case .left:
                TileStatus.shared.tile1 = tileList1[0]
                TileStatus.shared.tile2 = tileList1[1]
                TileStatus.shared.tile3 = tileList1[2]
                TileStatus.shared.tile4 = tileList1[3]
                TileStatus.shared.tile5 = tileList2[0]
                TileStatus.shared.tile6 = tileList2[1]
                TileStatus.shared.tile7 = tileList2[2]
                TileStatus.shared.tile8 = tileList2[3]
                TileStatus.shared.tile9 = tileList3[0]
                TileStatus.shared.tile10 = tileList3[1]
                TileStatus.shared.tile11 = tileList3[2]
                TileStatus.shared.tile12 = tileList3[3]
                TileStatus.shared.tile13 = tileList4[0]
                TileStatus.shared.tile14 = tileList4[1]
                TileStatus.shared.tile15 = tileList4[2]
                TileStatus.shared.tile16 = tileList4[3]
                break
            case .up:
                TileStatus.shared.tile1 = tileList1[0]
                TileStatus.shared.tile5 = tileList1[1]
                TileStatus.shared.tile9 = tileList1[2]
                TileStatus.shared.tile13 = tileList1[3]
                TileStatus.shared.tile2 = tileList2[0]
                TileStatus.shared.tile6 = tileList2[1]
                TileStatus.shared.tile10 = tileList2[2]
                TileStatus.shared.tile14 = tileList2[3]
                TileStatus.shared.tile3 = tileList3[0]
                TileStatus.shared.tile7 = tileList3[1]
                TileStatus.shared.tile11 = tileList3[2]
                TileStatus.shared.tile15 = tileList3[3]
                TileStatus.shared.tile4 = tileList4[0]
                TileStatus.shared.tile8 = tileList4[1]
                TileStatus.shared.tile12 = tileList4[2]
                TileStatus.shared.tile16 = tileList4[3]
                break
            case .down:
                TileStatus.shared.tile13 = tileList1[0]
                TileStatus.shared.tile9 = tileList1[1]
                TileStatus.shared.tile5 = tileList1[2]
                TileStatus.shared.tile1 = tileList1[3]
                TileStatus.shared.tile14 = tileList2[0]
                TileStatus.shared.tile10 = tileList2[1]
                TileStatus.shared.tile6 = tileList2[2]
                TileStatus.shared.tile2 = tileList2[3]
                TileStatus.shared.tile15 = tileList3[0]
                TileStatus.shared.tile11 = tileList3[1]
                TileStatus.shared.tile7 = tileList3[2]
                TileStatus.shared.tile3 = tileList3[3]
                TileStatus.shared.tile16 = tileList4[0]
                TileStatus.shared.tile12 = tileList4[1]
                TileStatus.shared.tile8 = tileList4[2]
                TileStatus.shared.tile4 = tileList4[3]
                break
        }
        
        TileStatus.shared.tileStatusArray = [TileStatus.shared.tile1 != 0 ? true : false,
                                             TileStatus.shared.tile2 != 0 ? true : false,
                                             TileStatus.shared.tile3 != 0 ? true : false,
                                             TileStatus.shared.tile4 != 0 ? true : false,
                                             TileStatus.shared.tile5 != 0 ? true : false,
                                             TileStatus.shared.tile6 != 0 ? true : false,
                                             TileStatus.shared.tile7 != 0 ? true : false,
                                             TileStatus.shared.tile8 != 0 ? true : false,
                                             TileStatus.shared.tile9 != 0 ? true : false,
                                             TileStatus.shared.tile10 != 0 ? true : false,
                                             TileStatus.shared.tile11 != 0 ? true : false,
                                             TileStatus.shared.tile12 != 0 ? true : false,
                                             TileStatus.shared.tile13 != 0 ? true : false,
                                             TileStatus.shared.tile14 != 0 ? true : false,
                                             TileStatus.shared.tile15 != 0 ? true : false,
                                             TileStatus.shared.tile16 != 0 ? true : false]
        return score
        
    }
    
    ///This function shifts the zeroes in the middle of the array to the end of the array
    func shiftZeroesToEnd(list1: [Int], list2: [Int], list3: [Int], list4: [Int]) -> (list1: [Int], list2: [Int], list3: [Int], list4: [Int]) {
        var count1: Int = 0
        var count2: Int = 0
        var count3: Int = 0
        var count4: Int = 0
        
        var tileList1 = list1
        var tileList2 = list2
        var tileList3 = list3
        var tileList4 = list4
        
        for i in 0..<4 {
            
            if (tileList1[i] != 0) {
                tileList1[count1] = tileList1[i]
                count1 += 1
            }
            
            if (tileList2[i] != 0) {
                tileList2[count2] = tileList2[i]
                count2 += 1
            }
            
            if (tileList3[i] != 0) {
                tileList3[count3] = tileList3[i]
                count3 += 1
            }
            
            if (tileList4[i] != 0) {
                tileList4[count4] = tileList4[i]
                count4 += 1
            }
        }
        
        while count1 < 4 {
            tileList1[count1] = 0
            count1 += 1
        }
        while count2 < 4 {
            tileList2[count2] = 0
            count2 += 1
        }
        while count3 < 4 {
            tileList3[count3] = 0
            count3 += 1
        }
        while count4 < 4 {
            tileList4[count4] = 0
            count4 += 1
        }
        
        return (tileList1, tileList2, tileList3, tileList4)
    }
}
