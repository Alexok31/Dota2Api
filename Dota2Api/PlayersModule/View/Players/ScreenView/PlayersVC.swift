//
//  ViewController.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/28/19.
//

import UIKit
import RealmSwift

class PlayersVC: UIViewController {
    
    @IBOutlet var favoritePlayers: UITableView!
    
    var playersViewModel : PlayersViewModelType?
    var playerTableViewModel : PlayerTableViewModelType?
    
    var notificationToken: NotificationToken? = nil
    let cellId = R.reuseIdentifier.playerTableCelId.identifier

    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegister()
        setViewModels()
        observeProfiles()
    }
    
    func cellRegister() {
        favoritePlayers.register(UINib(resource: R.nib.playerCellTableViewCell), forCellReuseIdentifier: cellId)
    }
    
    func observeProfiles() {
        notificationToken = playersViewModel?.profiles.observe({ (changes) in
            switch changes {
            case .initial:
                self.setViewModels()
                self.favoritePlayers.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                self.favoritePlayers.beginUpdates()
                self.setViewModels()
                self.favoritePlayers.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                     with: .automatic)
                self.favoritePlayers.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                self.favoritePlayers.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                self.favoritePlayers.endUpdates()
            case .error(let error):
                fatalError("\(error)")
            }
        })
    }
    
    func setViewModels() {
        playersViewModel = PlayersViewModel()
        guard let playersViewModel = playersViewModel else {return}
        let profoles = Array(playersViewModel.profiles)
        playerTableViewModel = PlayerTableViewModel(profiles: profoles)
    }

    @IBAction func addPlayer(_ sender: Any) {
        guard let addPlayerVc = R.storyboard.players.searchPlayerID() else {return}
        present(addPlayerVc, animated: true, completion: nil)
    }
    
    deinit {
        notificationToken?.invalidate()
    }
}
