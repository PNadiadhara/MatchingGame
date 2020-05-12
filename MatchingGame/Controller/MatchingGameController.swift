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
    
    private var products = [Products]() {
        didSet{
            DispatchQueue.main.async {
                self.GameBoardCollectionView.reloadData()
            }
            print(products.count)
        }
    }
    
    //MARK: -   Blue Player info
    @IBOutlet weak var bluePlayerName: UILabel!
    @IBOutlet weak var bluePlayerScoreInverted: UILabel!
    @IBOutlet weak var bluePlayerscore: UILabel!
    var blueName = String()
    var blueScore = 01
    
    //MARK: -   Red Player info
    @IBOutlet weak var redPlayerName: UILabel!
    @IBOutlet weak var redPlayerScoreInverted: UILabel!
    @IBOutlet weak var redPlayerScore: UILabel!
    var redName = String()
    var redScore = 01
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getImagesFromAPI()
        
        bluePlayerName.text = blueName
        bluePlayerscore.text = String(blueScore)
        bluePlayerScoreInverted.text = String(blueScore)
        bluePlayerName.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        bluePlayerScoreInverted.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        redPlayerName.text = redName
        redPlayerScore.text = String(redScore)
        redPlayerScoreInverted.text = String(redScore)
        redPlayerScoreInverted.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        

        
    }
    
    private func getImagesFromAPI(){
        ShopifyAPIClient.getAllProducts { (appError, products) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let products = products {
                self.products = products
            }
        }
        print(products.count)
    }
    

  

}

extension MatchingGameController: UICollectionViewDelegate {
    
}

//extension MatchingGameController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//
//}
