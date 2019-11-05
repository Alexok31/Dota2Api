//
//  ViewController.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/28/19.
//

import UIKit
import RxSwift
import RealmSwift


class PlayersVC: UIViewController {
    
    @IBOutlet var addFavoriteButton: UIButton!
    @IBOutlet var favoritePlayers: UITableView!
    
    var playersViewModel : PlayersViewModelType?
    var playerTableViewModel : PlayerTableViewModelType?
    
    var notificationToken: NotificationToken? = nil
    var disposeBag = DisposeBag()
    let cellId = R.reuseIdentifier.playerTableCelId.identifier
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegister()
        addFavoriteTapped()
        observeProfiles()
    }
    
    func cellRegister() {
        favoritePlayers.register(UINib(resource: R.nib.playerCellTableViewCell), forCellReuseIdentifier: cellId)
    }
    
    func addFavoriteTapped() {
        _ = addFavoriteButton.rx.tap
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {
                self.playersViewModel?.didAddFavorite.onNext(())
            }).disposed(by: disposeBag)
    }
    
    func observeProfiles() {
        notificationToken = playersViewModel?.profiles.observe({ (changes) in
            switch changes {
            case .initial:
                self.setViewModels()
                self.favoritePlayers.reloadData()
            case .update(_, let deletions, let insertions, _):
                self.favoritePlayers.beginUpdates()
                self.setViewModels()
                self.favoritePlayers.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                     with: .automatic)
                self.favoritePlayers.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                self.favoritePlayers.endUpdates()
            case .error(let error):
                fatalError("\(error)")
            }
        })
    }
    
    func setViewModels() {
        guard let playersViewModel = playersViewModel else {return}
        let profoles = Array(playersViewModel.profiles)
        playerTableViewModel = PlayerTableViewModel(profiles: profoles)
    }
    
    deinit {
        notificationToken?.invalidate()
    }
}
