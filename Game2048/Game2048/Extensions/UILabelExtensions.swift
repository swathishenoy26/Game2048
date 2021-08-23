//
//  UILabelExtensions.swift
//  Game2048
//
//  Created by Swathi on 23/08/21.
//

import UIKit

extension UILabel {
    
    ///This function changes the label background based on the tile value
    func updateLabelColor() {
        switch self.text! {
        case "":
            self.backgroundColor = UIColor.emptyTile
            break
        case "2":
            self.backgroundColor = UIColor.tile2
            break
        case "4":
            self.backgroundColor = UIColor.tile4
            break
        case "8":
            self.backgroundColor = UIColor.tile8
            break
        case "16":
            self.backgroundColor = UIColor.tile16
            break
        case "32":
            self.backgroundColor = UIColor.tile32
            break
        case "64":
            self.backgroundColor = UIColor.tile64
            break
        case "128":
            self.backgroundColor = UIColor.tile128
            break
        case "256":
            self.backgroundColor = UIColor.tile256
            break
        case "512":
            self.backgroundColor = UIColor.tile512
            break
        case "1024":
            self.backgroundColor = UIColor.tile1024
            break
        case "2048":
            self.backgroundColor = UIColor.tile2048
            break
        default:
            self.backgroundColor = UIColor.red
            break
        }
    }
}
