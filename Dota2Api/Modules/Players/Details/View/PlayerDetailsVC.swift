//
//  PlayerDetailsVC.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/6/19.
//

import UIKit

class PlayerDetailsVC: UIViewController {
    
    @IBOutlet var quantityWin: UILabel!
    @IBOutlet var quantityLose: UILabel!
    @IBOutlet var winRate: UILabel!
    @IBOutlet var rang: UIImageView!
    
    var playerDetailsViewModel : PlayerDetailsViewModelType?
    
    override func viewDidLoad() {
        print(playerDetailsViewModel?.playerId)
    }
    
}
