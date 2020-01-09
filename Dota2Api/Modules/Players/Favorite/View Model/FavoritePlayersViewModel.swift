//
//  PlayersViewModel.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/1/19.
//

import Foundation
import RealmSwift
import RxSwift

class FavoritePlayersViewModel: FavoritePlayersViewModelType {
    
    private var dataBaseServise : DataBaseServise
    
    var profiles: Results<GetPlayerInfoModel>
    let disposeBag = DisposeBag()
    
    //events
    let didAddFavorite = PublishSubject<Void>()
    var didUpdateFavoritePlayers = PublishSubject<Void>()
    
    init() {
        dataBaseServise = RealmDataBaseServise()
        profiles = dataBaseServise.fetch(modelType: GetPlayerInfoModel.self)
    }
    
    func playerTableViewModel() -> PlayerTableViewModelType {
        return PlayerTableViewModel(profiles: Array(profiles))
    }
}
