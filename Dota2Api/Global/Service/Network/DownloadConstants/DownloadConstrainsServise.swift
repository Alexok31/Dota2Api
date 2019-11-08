//
//  DownloadConstrainsServise.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/8/19.
//

import Foundation

protocol DownloadConstrainsServise {
    func heroStats()
}

class DownloadToRealmConstrainsServise: DownloadConstrainsServise {
    
    var constantsApiServise : ConstantsApiServise
    var dataBaseServise : DataBaseServise
    
    init() {
        constantsApiServise = AlamofireConstantsInfoServise()
        dataBaseServise = RealmDataBaseServise()
    }
    
    func heroStats() {
        constantsApiServise.getInfo(path: .heroStats, modelType: HeroesStatsModel.self) { (recultCode, recultModel) in
            if let heroStats = recultModel {
                self.dataBaseServise.addList(dataModel: heroStats)
            }
        }
    }
}
