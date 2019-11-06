//
//  PlayersViewModelType.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/1/19.
//

import Foundation
import RealmSwift
import RxSwift

protocol FavoritePlayersViewModelType {
    var profiles: Results<ProfileModel> {get}
    var didAddFavorite: PublishSubject<Void> {get}
    var didUpdateFavoritePlayers: PublishSubject<Void> {get}
    func playerTableViewModel() -> PlayerTableViewModelType
}
