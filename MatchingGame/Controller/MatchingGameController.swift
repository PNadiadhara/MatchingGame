//
//  MatchingGameController.swift
//  MatchingGame
//
//  Created by Pritesh Nadiadhara on 5/11/20.
//  Copyright © 2020 PriteshN. All rights reserved.
//

import UIKit

class MatchingGameController: UIViewController {
    @IBOutlet weak var GameBoardCollectionView: UICollectionView!
    
    //MARK: -   Blue Player info
    @IBOutlet weak var bluePlayerName: UILabel!
    @IBOutlet weak var bluePlayerScoreInverted: UILabel!
    @IBOutlet weak var bluePlayerscore: UILabel!
    
    //MARK: -   Red Player info
    @IBOutlet weak var redPlayerName: UILabel!
    @IBOutlet weak var redPlayerScoreInverted: UILabel!
    @IBOutlet weak var redPlayerScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

  

}
