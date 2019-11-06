//
//  PlayerDetailsViewModel.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/6/19.
//

import Foundation
import RxSwift

class PlayerDetailsViewModel: PlayerDetailsViewModelType {
    
    var playerId: Int
    
    init(playerId: Int) {
        self.playerId = playerId
    }
    
}
