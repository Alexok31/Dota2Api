//
//  PlayerDetailsViewModel.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/6/19.
//

import Foundation
import RxSwift
import RxCocoa

class PlayerDetailsViewModel: PlayerDetailsViewModelType {
    
    var playerInfo: GetPlayerInfoModel
    
    var playerId: Int {
        return playerInfo.accountID
    }
    
    var playerName: String {
        return playerInfo.personaname ?? ""
    }
    
    var dotaPlus: Bool {
        return playerInfo.plus
    }
    var playerWinLose: BehaviorRelay<PlayerWinLoseModel>?
    

//
//    var winRate: Int
//
//    var rangIcon: UIImage
    
    init(playerInfo: GetPlayerInfoModel) {
        self.playerInfo = playerInfo
    }
    
}
