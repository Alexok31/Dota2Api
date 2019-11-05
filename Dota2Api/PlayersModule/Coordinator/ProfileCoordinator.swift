//
//  File.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/5/19.
//

import Foundation
import RxSwift

class ProfileCoordinator: DefaultCoordinator {
    
    var navigationController: UINavigationController
    weak var viewController: UIViewController?
    var viewModel: PlayersViewModel?
    
    let disposeBag = DisposeBag()
    
    init() {
        self.navigationController = UINavigationController(rootViewController: R.storyboard.players.playersID()!)
        self.viewController = navigationController.topViewController as? PlayersVC
        self.viewModel = PlayersViewModel()
    }
    
    func start() {
        let playersVC = viewController as? PlayersVC
        playersVC?.playersViewModel = viewModel
        
        viewModel?.didAddFavorite.subscribe(onNext: {
            self.showSearchPlayer()
        }).disposed(by: disposeBag)
    }
    
    func showSearchPlayer() {
        guard let searchPlayerVC = R.storyboard.players.searchPlayerID() else {return}
        searchPlayerVC.searchPlayerViewModel = SearchPlayerViewModel(playerServise: AlamofirePlayerServise())
        self.navigationController.present(searchPlayerVC, animated: true)
    }
}
