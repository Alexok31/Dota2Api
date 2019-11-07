//
//  File.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/7/19.
//

import Foundation

protocol ConstantsApiServise {
    func getInfo<ModelType: Decodable>(path: AlamofireConstantsInfoServise.Path, modelType: ModelType.Type,
                                       completion: @escaping complitionResult<ModelType>)
}
