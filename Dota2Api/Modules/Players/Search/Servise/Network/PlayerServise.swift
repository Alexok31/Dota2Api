//
//  PlayerServise.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/28/19.
//

import Foundation
import Alamofire

protocol SearchPlayerApiServise {
    func byUserName(_ name: String, completion: @escaping (_ result: ResultsCode, _ players: [GetPlayerInfoModel]?) -> ())
}
