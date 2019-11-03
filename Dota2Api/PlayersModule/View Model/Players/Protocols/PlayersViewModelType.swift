//
//  PlayersViewModelType.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/1/19.
//

import Foundation
import RealmSwift

protocol PlayersViewModelType {
    var profiles: Results<ProfileModel> {get}
}