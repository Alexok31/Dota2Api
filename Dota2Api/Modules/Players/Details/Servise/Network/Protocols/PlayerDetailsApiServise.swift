//
//  PlayerDetailsApiServise.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/7/19.
//

import Foundation

protocol PlayerDetailsApiServise {
    func getInfo<ModelType: Decodable>(path: AlamofirePlayerDetailsServise.Path, modelType: ModelType.Type,
                                       completion: @escaping complitionResult<ModelType>)
}
