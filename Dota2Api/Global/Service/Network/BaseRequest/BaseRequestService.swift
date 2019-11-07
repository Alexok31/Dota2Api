//
//  BaseRequestService.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/28/19.
//

import Foundation
import Alamofire

protocol BaseRequestService {
    func getDataModel<DataModel:Decodable>(_ request: BaseParameterPatch, model: DataModel.Type, complition: @escaping complitionResult<DataModel>)
}

protocol BaseParameterPatch {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: Any] { get }
}
