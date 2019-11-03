//
//  PlayersViewModel.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/1/19.
//

import Foundation
import RealmSwift

class PlayersViewModel: PlayersViewModelType {
    
    private var dataBaseServise : DataBaseServise?
    
    var profiles: Results<ProfileModel>
    
    init() {
        dataBaseServise = RealmDataBaseServise()
        profiles = (dataBaseServise?.fetch(modelType: ProfileModel.self))!
    }
}
