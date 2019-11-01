//
//  PlayerServise.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/28/19.
//

import Foundation
import Alamofire


class AlamofirePlayerServise: PlayerApiServise {
    
    private var baseRequestService : BaseRequestService
    
    init() {
        self.baseRequestService = AlamofireBaseRequestService()
    }
    
    enum Path {
        case searchUserName(String)
        case getPlayer(String)
        
        
        var method: HTTPMethod {
            switch self {
            case .searchUserName, .getPlayer : return .get
            }
        }
        
        var path: String {
            switch self {
            case .searchUserName:
                return DotaApiPath.base + "/search"
            case .getPlayer(let id):
                return DotaApiPath.base + "/players/" + id
            }
            
        }
        
        var parameters: [String: Any] {
            switch self {
            case .searchUserName(let userName):
                return ["q": userName]
            case .getPlayer(_):
                return ["":""]
            }
        }
    }
    
    func searchUserName(userName: String, closure: @escaping (_ result: ResultsCode, _ players: [ProfileModel]?) -> ()) {
        let path = Path.searchUserName(userName)
        baseRequestService.getDataModel(path, model: [ProfileModel].self) { (result, players) in
            closure(result, players)
        }
    }
    
    func getPlayer(byID id: String, closure: @escaping (_ result: ResultsCode, _ players: PlayerInfo?) -> ()) {
        let path = Path.getPlayer(id)
        baseRequestService.getDataModel(path, model: PlayerInfo.self) { (result, playerInfo) in
            closure(result, playerInfo)
        }
    }
}
