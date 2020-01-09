//
//  PlayerCellViewModel.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/29/19.
//

import Foundation

class PlayerCellViewModel : PlayerCellViewModelType {
    
    private var searchPlayerModel : GetPlayerInfoModel
    
    init(searchPlayerModel : GetPlayerInfoModel) {
        self.searchPlayerModel = searchPlayerModel
    }
    
    var userName: String {
        return searchPlayerModel.personaname ?? ""
    }
    
    var accountID: String {
        return "\(searchPlayerModel.accountID)"
    }
    
    var avatarImgUrl: String {
        return searchPlayerModel.avatarfull ?? ""
    }
}
