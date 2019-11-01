//
//  PlayerServise.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/28/19.
//

import Foundation

protocol PlayerApiServise {
    func searchUserName(userName: String, closure: @escaping (_ result: ResultsCode, _ players: [ProfileModel]?) -> ())
    func getPlayer(byID id: String, closure: @escaping (_ result: ResultsCode, _ players: PlayerInfo?) -> ())
}
