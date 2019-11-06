//
//  PlayerDetails.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/6/19.
//

import UIKit
import RxSwift

class PlayerDetailsCoordinator: DefaultCoordinator {
    
    var navigationController: UINavigationController
    weak var viewController: UIViewController?
    var viewModel: PlayerDetailsViewModelType?
    
    var disposeBag = DisposeBag()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        viewController = R.storyboard.players.playerDetailsID()
        guard let playerDetailsVC = viewController as? PlayerDetailsVC else {return}
        playerDetailsVC.playerDetailsViewModel = viewModel
        viewController?.hidesBottomBarWhenPushed = true
        navigationController.pushViewController(playerDetailsVC, animated: true)
    }
    
    
    
    
}
