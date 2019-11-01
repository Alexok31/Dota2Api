//
//  BaseNetworkService.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/28/19.
//

import Foundation
import Alamofire

struct AlamofireRequestModal {
    var method: HTTPMethod
    var path: String
    var parameters: [String: Any]
}

typealias complitionResult<DataModel: Decodable> = (_ result: ResultsCode, _ dataModel: DataModel?) -> ()

class AlamofireBaseRequestService: BaseRequestService {
    
    func callWebServiceAlamofire(_ alamoReq: AlamofireRequestModal, success: @escaping ((_ responseData: Data) -> Void), failureCode: @escaping ((_ code: ResultsCode) -> Void)) {
        
        let request = AF.request(alamoReq.path, method: alamoReq.method, parameters: alamoReq.parameters)

        // Call response handler method of alamofire
        request.validate(statusCode: 200..<600).responseData(completionHandler: { response in
            let statusCode = response.response?.statusCode
            switch response.result {
            case .success(let data):
                switch statusCode {
                case 200:
                    success(data)
                default:
                    failureCode(ResultsCode.serviceNotResponding)
                }
            case .failure(_):
                NetworkHelper.shared.checkInternet(closure: { (result) in
                    failureCode(result)
                })
            }
            
        })
    }
    
    func getDataModel<DataModel: Decodable>(_ request: AlamofirePlayerServise.Path, model: DataModel.Type, complition: @escaping complitionResult<DataModel>) {
        
        let requestProperties = AlamofireRequestModal(method: request.method, path: request.path, parameters: request.parameters)
        self.callWebServiceAlamofire(requestProperties, success: { (data) in
            do {
                let dataModel = try JSONDecoder().decode(model, from: data)
                complition(.successful, dataModel)
            } catch {
                complition(.serviceNotResponding, nil)
            }
        }) { (failureCode) in
            complition(failureCode, nil)
        }
    }
}
