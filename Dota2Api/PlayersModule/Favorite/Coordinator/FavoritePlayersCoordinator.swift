//
//  File.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/5/19.
//

import Foundation
import RxSwift

class FavoritePlayersCoordinator: DefaultCoordinator {
    
    var navigationController: UINavigationController
    weak var viewController: UIViewController?
    var viewModel: FavoritePlayersViewModelType
    var tableViewModel: PlayerTableViewModelType
    
    let disposeBag = DisposeBag()
    
    init() {
        self.navigationController = UINavigationController(rootViewController: R.storyboard.players.playersID()!)
        self.viewController = navigationController.topViewController as? FavoritePlayersVC
        self.viewModel = FavoritePlayersViewModel()
        self.tableViewModel = viewModel.playerTableViewModel()
    }
    
    func start() {
        let favoritePlayers = viewController as? FavoritePlayersVC
        favoritePlayers?.playersViewModel = viewModel
        favoritePlayers?.playerTableViewModel = tableViewModel
        
        viewModel.didAddFavorite.subscribe(onNext: {
            self.showSearchPlayer()
        }).disposed(by: disposeBag)

        updateFavoritePlayers()
    }
    
    func showSearchPlayer() {
        let searchPlayerCoordinator = SearchPlayerCoordinator(navigationController: navigationController)
        searchPlayerCoordinator.start()
    }
    
    func updateFavoritePlayers() {
        viewModel.didUpdateFavoritePlayers.subscribe(onNext: {
            self.updateTableViewModel()
        }).disposed(by: disposeBag)
    }
    
    func updateTableViewModel() {
        let favoritePlayers = viewController as? FavoritePlayersVC
        let playerTableViewModel = viewModel.playerTableViewModel()
        tableViewModel = playerTableViewModel
        favoritePlayers?.playerTableViewModel = tableViewModel
        
        tableViewModel.didOpenPlayerDetails.subscribe(onNext: {
            self.showPlayerDetails()
        }).disposed(by: disposeBag)
      }
    
    func showPlayerDetails() {
        let playerDetailsCoordinator = PlayerDetailsCoordinator(navigationController: navigationController)
        playerDetailsCoordinator.viewModel = tableViewModel.playerDetails()
        playerDetailsCoordinator.start()
    }
}
