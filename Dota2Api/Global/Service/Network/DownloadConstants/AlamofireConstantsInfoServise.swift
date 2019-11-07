//
//  DownloadConstants.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/7/19.
//

import Foundation
import Alamofire

class AlamofireConstantsInfoServise: ConstantsApiServise {
    
    var baseRequestService : BaseRequestService
    
    init() {
        baseRequestService = AlamofireBaseRequestService()
    }
    
    enum Path: BaseParameterPatch {
        case heroStats
        
        
        var method: HTTPMethod {
            switch self {
            case .heroStats:
                return .get
            }
        }
        
        var path: String {
            switch self {
            case .heroStats:
                return DotaApiPath.base + "/heroStats"
            }
        }
        
        var parameters: [String: Any] {
            switch self {
            case .heroStats:
                return ["":""]
            }
        }
    }
    
    func getInfo<ModelType: Decodable>(path: AlamofireConstantsInfoServise.Path, modelType: ModelType.Type,
                                                        completion: @escaping complitionResult<ModelType>) {
        baseRequestService.getDataModel(path, model: ModelType.self) { (resultCode, resultModel) in
            completion(resultCode, resultModel)
        }
    }
    
}
