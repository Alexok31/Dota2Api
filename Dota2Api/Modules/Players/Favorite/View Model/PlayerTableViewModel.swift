//
//  SearchPlayerCollectionViewModel.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/29/19.
//

import Foundation
import RealmSwift
import RxSwift

class PlayerTableViewModel: PlayerTableViewModelType {
    
    private var players : [GetPlayerInfoModel]
    private var selectedIndexPath: IndexPath?
    
    var dataBaseServise : DataBaseServise?
    
    //event
    let didOpenPlayerDetails = PublishSubject<Void>()
    
    init(profiles : [GetPlayerInfoModel]?) {
        self.players = profiles ?? [GetPlayerInfoModel]()
        dataBaseServise = RealmDataBaseServise()
    }
    
    var numberOfRows : Int {
        return players.count
    }
    
    func profileCell(for indexPath: IndexPath) -> PlayerCellViewModelType {
        let profile = players[indexPath.row]
        return PlayerCellViewModel(searchPlayerModel: profile)
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        selectedIndexPath = indexPath
    }
    
    func playerDetails() -> PlayerDetailsViewModelType? {
        guard let index = selectedIndexPath else { return nil }
        let player = players[index.row]
        return PlayerDetailsViewModel(playerInfo: player)
    }
    
    func addToFavorite() {
        guard let index = selectedIndexPath else {return}
        let profile = players[index.row]
        dataBaseServise?.addSingle(dataModel: profile)
    }
    
    func removeFromFavorite() {
        guard let index = selectedIndexPath else {return}
        let profile = players[index.row]
        dataBaseServise?.remove(dataModel: profile)
    }
    
}
