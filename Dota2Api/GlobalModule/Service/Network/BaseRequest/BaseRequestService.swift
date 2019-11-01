//
//  BaseRequestService.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/28/19.
//

import Foundation

protocol BaseRequestService {
    func getDataModel<DataModel:Decodable>(_ request: AlamofirePlayerServise.Path, model: DataModel.Type, complition: @escaping complitionResult<DataModel>)
}
