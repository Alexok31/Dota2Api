//
//  File.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/7/19.
//

import Foundation

// MARK: - HeroStatsModel
struct HeroStatsModel: Codable {
    let id: Int
    let name, localizedName: String
    let primaryAttr: PrimaryAttr
    let attackType: AttackType
    let roles: [Role]
    let img, icon: String
    

    enum CodingKeys: String, CodingKey {
        case id, name
        case localizedName = "localized_name"
        case primaryAttr = "primary_attr"
        case attackType = "attack_type"
        case roles, img, icon
    }
}

enum AttackType: String, Codable {
    case melee = "Melee"
    case ranged = "Ranged"
}

enum PrimaryAttr: String, Codable {
    case agi = "agi"
    case int = "int"
    case str = "str"
}

enum Role: String, Codable {
    case carry = "Carry"
    case disabler = "Disabler"
    case durable = "Durable"
    case escape = "Escape"
    case initiator = "Initiator"
    case jungler = "Jungler"
    case nuker = "Nuker"
    case pusher = "Pusher"
    case support = "Support"
}

typealias HeroesStatsModel = [HeroStatsModel]
