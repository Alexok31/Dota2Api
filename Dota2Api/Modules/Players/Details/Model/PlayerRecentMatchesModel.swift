//
//  File.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/7/19.
//

import Foundation
import Foundation

// MARK: - RankingsHero
struct PlayerRecentMatcheModel: Decodable {
    let matchID, playerSlot: Int?
    let radiantWin: Bool?
    let duration, gameMode, lobbyType, heroID: Int?
    let startTime: Int?
    let version: Int?
    let kills, deaths, assists: Int?
    let skill: Int?
    let xpPerMin, goldPerMin, heroDamage, towerDamage: Int?
    let heroHealing, lastHits: Int?
    let lane, laneRole: Int?
    let isRoaming: Bool?
    let cluster, leaverStatus: Int?
    let partySize: Int?

    enum CodingKeys: String, CodingKey {
        case matchID = "match_id"
        case playerSlot = "player_slot"
        case radiantWin = "radiant_win"
        case duration
        case gameMode = "game_mode"
        case lobbyType = "lobby_type"
        case heroID = "hero_id"
        case startTime = "start_time"
        case version, kills, deaths, assists, skill
        case xpPerMin = "xp_per_min"
        case goldPerMin = "gold_per_min"
        case heroDamage = "hero_damage"
        case towerDamage = "tower_damage"
        case heroHealing = "hero_healing"
        case lastHits = "last_hits"
        case lane
        case laneRole = "lane_role"
        case isRoaming = "is_roaming"
        case cluster
        case leaverStatus = "leaver_status"
        case partySize = "party_size"
    }
}

typealias PlayerRecentMatchesModel = [PlayerRecentMatcheModel]
