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
    
    func addSingle<ModelType: Object>(dataModel: ModelType) {
        print(realm.configuration.fileURL?.absoluteString ?? "")
        try! realm.write {
            realm.add(dataModel, update: .modified)
        }
    }
    
    func remove<ModelType: Object>(dataModel: ModelType) {
        try! realm.write {
            realm.delete(dataModel)
        }
    }
    
    func fetch<ModelType: Object>(modelType: ModelType.Type) -> Results<ModelType> {
        let dataInfo = realm.objects(modelType)
        return dataInfo
    }
    
    func addList<ModelType>(dataModel: [ModelType]) where ModelType : Object {
        try! realm.write {
            realm.add(dataModel)
        }
    }
}
