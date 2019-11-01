//
//  RealmDataBaseServise.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/1/19.
//

import Foundation
import RealmSwift

class RealmDataBaseServise: DataBaseServise {
    
    fileprivate lazy var realm = try! Realm()
    
    func fetch<ModelType: Object>(modelType: ModelType.Type) -> ModelType? {
        let dataInfo = realm.objects(modelType).last
        return dataInfo
    }
    
    func add<ModelType: Object>(dataModel: ModelType) {
        print(realm.configuration.fileURL?.absoluteString ?? "")
        try! realm.write {
            realm.add(dataModel, update: .modified)
        }
    }
    
}
