//
//  PlayersViewModel.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/1/19.
//

import Foundation
import RealmSwift
import RxSwift

class PlayersViewModel: PlayersViewModelType {
    
    private var dataBaseServise : DataBaseServise
    
    var profiles: Results<ProfileModel>
    
    //event
    let didAddFavorite = PublishSubject<Void>()
    
    init() {
        dataBaseServise = RealmDataBaseServise()
        profiles = dataBaseServise.fetch(modelType: ProfileModel.self)
    }
}
