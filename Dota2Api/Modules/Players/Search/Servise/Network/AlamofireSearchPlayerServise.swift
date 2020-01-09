//
//  PlayerServise.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/28/19.
//

import Foundation
import Alamofire


class AlamofireSearchPlayerServise: SearchPlayerApiServise {
    
    private var baseRequestService : BaseRequestService
    
    init() {
        self.baseRequestService = AlamofireBaseRequestService()
    }
    
    enum Path: BaseParameterPatch {
        
        case searchUserName(String)
        
        var method: HTTPMethod {
            switch self {
            case .searchUserName : return .get
            }
        }
        
        var path: String {
            switch self {
            case .searchUserName:
                return DotaApiPath.base + "/search"
            }
        }
        
        var parameters: [String: Any] {
            switch self {
            case .searchUserName(let userName):
                return ["q": userName]
            }
        }
    }
    
    func byUserName(_ name: String, completion: @escaping (_ result: ResultsCode, _ players: [GetPlayerInfoModel]?) -> ()) {
        let path = Path.searchUserName(name)
        baseRequestService.getDataModel(path, model: [GetPlayerInfoModel].self) { (result, players) in
            completion(result, players)
        }
    }
}
