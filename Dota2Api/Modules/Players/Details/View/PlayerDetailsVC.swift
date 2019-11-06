//
//  PlayerDetailsVC.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/6/19.
//

import UIKit

class PlayerDetailsVC: UIViewController {
    
    var playerDetailsViewModel : PlayerDetailsViewModelType?
    
    override func viewDidLoad() {
        print(playerDetailsViewModel?.playerId)
    }
    
}
