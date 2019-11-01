//
//  NetworkHelper.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/28/19.
//

import Foundation
import Alamofire

class NetworkHelper {
    
    static let shared = NetworkHelper()
    private init() {}
    
    var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    func checkInternet(closure: @escaping (_ result: ResultsCode) -> ()) {
        if !isConnectedToInternet {
            closure(ResultsCode.noInternetConnection)
        } else {
            closure(ResultsCode.serviceNotResponding)
        }
    }
    
    func openURl(_ url: String) {
        if let url = URL(string: url), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}




