//
//  ViewController.swift
//  MatchingGame
//
//  Created by Pritesh Nadiadhara on 5/6/20.
//  Copyright © 2020 PriteshN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bluePlayerName: UITextField!
    @IBOutlet weak var redPlayerName: UITextField!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var blueName = bluePlayerName.text ?? "Blue"
//        var redName = redPlayerName.text ?? "Red"
    }

    @IBAction func startMatchButton(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGame" {
            let destinationController = segue.destination as! MatchingGameController
            destinationController.blueName = bluePlayerName.text ?? "Blue"
            destinationController.redName = redPlayerName.text ?? "R"
        }
    }
    
}

