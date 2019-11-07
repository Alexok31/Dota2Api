//
//  DetailsPlayerServise.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/7/19.
//

import Alamofire

class AlamofirePlayerDetailsServise: PlayerDetailsApiServise {
    
    private var baseRequestService : BaseRequestService
    
    init() {
        self.baseRequestService = AlamofireBaseRequestService()
    }
    
    enum Path: BaseParameterPatch {
        case getPlayer(id: String)
        case winLose(id: String)
        case recentMatches(id: String)
        case counts(id: String)
        case playHeroes(id: String)
        case rankingsHeroes(id: String)
        case wordcloud(id: String)
        case totalsActionsInGame(id: String)
        
        var method: HTTPMethod {
            switch self {
            case .getPlayer, .winLose, .recentMatches,
                 .counts, .wordcloud, .rankingsHeroes,
                 .playHeroes, .totalsActionsInGame:
                return .get
            }
        }
        
        var path: String {
            switch self {
            case .getPlayer(let id):
                return DotaApiPath.base + "/players/" + id
            case .winLose(let id):
                return DotaApiPath.base + "/players/" + id + "/wl"
            case .recentMatches(let id):
                return DotaApiPath.base + "/players/" + id + "/recentMatches"
            case .counts(let id):
                return DotaApiPath.base + "/players/" + id + "/counts"
            case .wordcloud(let id):
                return DotaApiPath.base + "/players/" + id + "/wordcloud"
            case .rankingsHeroes(let id):
                return DotaApiPath.base + "/players/" + id + "/rankings"
            case .playHeroes(let id):
                return DotaApiPath.base + "/players/" + id + "/heroes"
            case .totalsActionsInGame(let id):
                return DotaApiPath.base + "/players/" + id + "/totals"
            }
        }
        
        var parameters: [String: Any] {
            switch self {
            case .getPlayer, .winLose, .recentMatches,
                 .counts, .wordcloud, .rankingsHeroes,
                 .playHeroes, .totalsActionsInGame:
                return ["":""]
            }
        }
    }
    
    func getInfo<ModelType: Decodable>(path: AlamofirePlayerDetailsServise.Path, modelType: ModelType.Type,
                                       completion: @escaping complitionResult<ModelType>) {
        baseRequestService.getDataModel(path, model: ModelType.self) { (resultCode, resultModel) in
            completion(resultCode, resultModel)
        }
    }
}
