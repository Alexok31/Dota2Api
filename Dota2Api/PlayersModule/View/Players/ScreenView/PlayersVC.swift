//
//  ViewController.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/28/19.
//

import UIKit

class PlayersVC: UIViewController {
    
    @IBOutlet var favoritePlayers: UITableView!
    
    var playersViewModel : PlayersViewModelType?
    var playerTableViewModel : PlayerTableViewModelType?
    
    let cellId = R.reuseIdentifier.playerTableCelId.identifier

    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegister()
        setViewModels()
    }
    
    func cellRegister() {
        favoritePlayers.register(UINib(resource: R.nib.playerCellTableViewCell), forCellReuseIdentifier: cellId)
    }
    
    func setViewModels() {
        playersViewModel = PlayersViewModel()
        playerTableViewModel = PlayerTableViewModel(profiles: playersViewModel?.profiles)
        DispatchQueue.main.async {
            self.favoritePlayers.reloadData()
        }
    }

    @IBAction func addPlayer(_ sender: Any) {
        guard let addPlayerVc = R.storyboard.players.searchPlayerID() else {return}
        addPlayerVc.stateChangeDelegate = self
        present(addPlayerVc, animated: true, completion: nil)
    }
}

extension PlayersVC : StateChange {
    
    func updatePlayers() {
        setViewModels()
    }
}

