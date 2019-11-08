//
//  RealmProfileManager.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/31/19.
//

import Foundation
import RealmSwift

protocol DataBaseServise {
    func addSingle<ModelType: Object>(dataModel: ModelType)
    func addList<ModelType: Object>(dataModel: [ModelType])
    func remove<ModelType: Object>(dataModel: ModelType)
    func fetch<ModelType: Object>(modelType: ModelType.Type) -> Results<ModelType>
}
