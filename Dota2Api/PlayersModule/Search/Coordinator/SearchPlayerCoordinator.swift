//
//  SearchCoordinator.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/6/19.
//

import UIKit
import RxSwift

class SearchPlayerCoordinator: DefaultCoordinator {
    
    var navigationController: UINavigationController
    weak var viewController: UIViewController?
    var viewModel: SearchPlayerViewModelType
    
    var disposeBag = DisposeBag()
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
        viewModel = SearchPlayerViewModel(playerServise: AlamofirePlayerServise())
    }
    
    func start() {
        viewController = R.storyboard.players.searchPlayerID()
        guard let searchPlayerVC = viewController as? SearchPlayerVC else {return}
        searchPlayerVC.searchPlayerViewModel = viewModel
        self.navigationController.present(searchPlayerVC, animated: true)
        clouseClouse()
    }
    
    func clouseClouse() {
        viewModel.didClouseSearch.subscribe(onNext: {
            self.viewController?.dismiss(animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }
    
}
