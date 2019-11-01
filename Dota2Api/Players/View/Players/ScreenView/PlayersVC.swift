//
//  ViewController.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/28/19.
//

import UIKit

class PlayersVC: UIViewController {
    
    @IBOutlet var playerCollection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func addPlayer(_ sender: Any) {
        guard let addPlayerVc = R.storyboard.players.searchPlayerID() else {return}
        present(addPlayerVc, animated: true, completion: nil)
    }
    
}

