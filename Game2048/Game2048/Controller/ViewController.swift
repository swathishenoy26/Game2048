//
//  ViewController.swift
//  Game2048
//
//  Created by Swathi on 22/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCurrentScore: UILabel!
    @IBOutlet weak var lblHighScore: UILabel!
    
    @IBOutlet weak var lblTile1: UILabel!
    @IBOutlet weak var lblTile2: UILabel!
    @IBOutlet weak var lblTile3: UILabel!
    @IBOutlet weak var lblTile4: UILabel!
    @IBOutlet weak var lblTile5: UILabel!
    @IBOutlet weak var lblTile6: UILabel!
    @IBOutlet weak var lblTile7: UILabel!
    @IBOutlet weak var lblTile8: UILabel!
    @IBOutlet weak var lblTile9: UILabel!
    @IBOutlet weak var lblTile10: UILabel!
    @IBOutlet weak var lblTile11: UILabel!
    @IBOutlet weak var lblTile12: UILabel!
    @IBOutlet weak var lblTile13: UILabel!
    @IBOutlet weak var lblTile14: UILabel!
    @IBOutlet weak var lblTile15: UILabel!
    @IBOutlet weak var lblTile16: UILabel!
    
    var scoreDetails = ScoreDetails()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scoreDetails.highScore = UserDefaults.standard.integer(forKey: "highScore")
        self.lblHighScore.text = String(self.scoreDetails.highScore)
        self.setupUI()
        self.setupGestures()
    }
    
    ///Initial UI related setup to be done here
    ///We call insertTile twice to insert 2 tiles in the beginning of the game
    func setupUI() {
        self.scoreDetails.currentScore = 0
        self.lblCurrentScore.text = String(self.scoreDetails.currentScore)
        self.insertTile()
        self.insertTile()
    }
    
    ///Add direction swipe gesture recognizers
    func setupGestures() {
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleRightSwipe))
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleLeftSwipe))
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleUpSwipe))
        upSwipe.direction = .up
        self.view.addGestureRecognizer(upSwipe)
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleDownSwipe))
        downSwipe.direction = .down
        self.view.addGestureRecognizer(downSwipe)
    }
    
    ///Handle Right swipe
    @objc func handleRightSwipe() {
        let score = GameLogic.shared.shiftTile(direction: .right)
        self.updateTiles()
        self.lblCurrentScore.text = String(Int(self.lblCurrentScore.text!)! + score)
        self.insertTile()
    }
    
    ///Handle Left swipe
    @objc func handleLeftSwipe() {
        let score = GameLogic.shared.shiftTile(direction: .left)
        self.updateTiles()
        self.lblCurrentScore.text = String(Int(self.lblCurrentScore.text!)! + score)
        self.insertTile()
    }
    
    ///Handle Up swipe
    @objc func handleUpSwipe() {
        let score = GameLogic.shared.shiftTile(direction: .up)
        self.updateTiles()
        self.lblCurrentScore.text = String(Int(self.lblCurrentScore.text!)! + score)
        self.insertTile()
    }
    
    ///Handle Down swipe
    @objc func handleDownSwipe() {
        let score = GameLogic.shared.shiftTile(direction: .down)
        self.updateTiles()
        self.lblCurrentScore.text = String(Int(self.lblCurrentScore.text!)! + score)
        self.insertTile()
    }
    
    ///This function is called for Updating the tile values after the swipe changes
    func updateTiles() {
        self.lblTile1.text = TileStatus.shared.tile1 != 0 ? String(TileStatus.shared.tile1) : ""
        self.lblTile2.text = TileStatus.shared.tile2 != 0 ? String(TileStatus.shared.tile2) : ""
        self.lblTile3.text = TileStatus.shared.tile3 != 0 ? String(TileStatus.shared.tile3) : ""
        self.lblTile4.text = TileStatus.shared.tile4 != 0 ? String(TileStatus.shared.tile4) : ""
        self.lblTile5.text = TileStatus.shared.tile5 != 0 ? String(TileStatus.shared.tile5) : ""
        self.lblTile6.text = TileStatus.shared.tile6 != 0 ? String(TileStatus.shared.tile6) : ""
        self.lblTile7.text = TileStatus.shared.tile7 != 0 ? String(TileStatus.shared.tile7) : ""
        self.lblTile8.text = TileStatus.shared.tile8 != 0 ? String(TileStatus.shared.tile8) : ""
        self.lblTile9.text = TileStatus.shared.tile9 != 0 ? String(TileStatus.shared.tile9) : ""
        self.lblTile10.text = TileStatus.shared.tile10 != 0 ? String(TileStatus.shared.tile10) : ""
        self.lblTile11.text = TileStatus.shared.tile11 != 0 ? String(TileStatus.shared.tile11) : ""
        self.lblTile12.text = TileStatus.shared.tile12 != 0 ? String(TileStatus.shared.tile12) : ""
        self.lblTile13.text = TileStatus.shared.tile13 != 0 ? String(TileStatus.shared.tile13) : ""
        self.lblTile14.text = TileStatus.shared.tile14 != 0 ? String(TileStatus.shared.tile14) : ""
        self.lblTile15.text = TileStatus.shared.tile15 != 0 ? String(TileStatus.shared.tile15) : ""
        self.lblTile16.text = TileStatus.shared.tile16 != 0 ? String(TileStatus.shared.tile16) : ""
    }
    
    ///This function  inserts a random tile at a random empty position
    func insertTile() {
        let tileNum = GameLogic.shared.getRandomEmptyTile()
        let randomNum = GameLogic.shared.getNextRandomNumber()
        switch tileNum {
            case 1:
                lblTile1.text = randomNum
                TileStatus.shared.tile1 = Int(randomNum) ?? 0
                break
            case 2:
                lblTile2.text = randomNum
                TileStatus.shared.tile2 = Int(randomNum) ?? 0
                break
            case 3:
                lblTile3.text = randomNum
                TileStatus.shared.tile3 = Int(randomNum) ?? 0
                break
            case 4:
                lblTile4.text = randomNum
                TileStatus.shared.tile4 = Int(randomNum) ?? 0
                break
            case 5:
                lblTile5.text = randomNum
                TileStatus.shared.tile5 = Int(randomNum) ?? 0
                break
            case 6:
                lblTile6.text = randomNum
                TileStatus.shared.tile6 = Int(randomNum) ?? 0
                break
            case 7:
                lblTile7.text = randomNum
                TileStatus.shared.tile7 = Int(randomNum) ?? 0
                break
            case 8:
                lblTile8.text = randomNum
                TileStatus.shared.tile8 = Int(randomNum) ?? 0
                break
            case 9:
                lblTile9.text = randomNum
                TileStatus.shared.tile9 = Int(randomNum) ?? 0
                break
            case 10:
                lblTile10.text = randomNum
                TileStatus.shared.tile10 = Int(randomNum) ?? 0
                break
            case 11:
                lblTile11.text = randomNum
                TileStatus.shared.tile11 = Int(randomNum) ?? 0
                break
            case 12:
                lblTile12.text = randomNum
                TileStatus.shared.tile12 = Int(randomNum) ?? 0
                break
            case 13:
                lblTile13.text = randomNum
                TileStatus.shared.tile13 = Int(randomNum) ?? 0
                break
            case 14:
                lblTile14.text = randomNum
                TileStatus.shared.tile14 = Int(randomNum) ?? 0
                break
            case 15:
                lblTile15.text = randomNum
                TileStatus.shared.tile15 = Int(randomNum) ?? 0
                break
            case 16:
                lblTile16.text = randomNum
                TileStatus.shared.tile16 = Int(randomNum) ?? 0
                break
            default:
                let alert = UIAlertController(title: "Game Over", message: "No more moves left!!", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: {_ in
                    self.restartGame()
                }))

                self.present(alert, animated: true)
                return
        }
        
        //Update the TileStatusArray after tile insertion
        TileStatus.shared.tileStatusArray[tileNum-1] = true
        
        //Update the score details
        self.scoreDetails.currentScore = Int(self.lblCurrentScore.text!)!
        if self.scoreDetails.highScore < self.scoreDetails.currentScore {
            self.scoreDetails.highScore = self.scoreDetails.currentScore
            self.lblHighScore.text = String(self.scoreDetails.highScore)
            UserDefaults.standard.set(self.scoreDetails.highScore, forKey: "highScore")
        }
        
        self.updateLabels()
    }
    
    ///This function updates the tile appearance based on the tile value
    func updateLabels() {
        self.lblTile1.updateLabelColor()
        self.lblTile2.updateLabelColor()
        self.lblTile3.updateLabelColor()
        self.lblTile4.updateLabelColor()
        self.lblTile5.updateLabelColor()
        self.lblTile6.updateLabelColor()
        self.lblTile7.updateLabelColor()
        self.lblTile8.updateLabelColor()
        self.lblTile9.updateLabelColor()
        self.lblTile10.updateLabelColor()
        self.lblTile11.updateLabelColor()
        self.lblTile12.updateLabelColor()
        self.lblTile13.updateLabelColor()
        self.lblTile14.updateLabelColor()
        self.lblTile15.updateLabelColor()
        self.lblTile16.updateLabelColor()
    }
    
    ///Resets the game status
    func restartGame() {
        TileStatus.shared.resetStatus()
        self.updateTiles()
        self.setupUI()
    }
}

