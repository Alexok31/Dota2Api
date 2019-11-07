//
//  CountsModel.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/7/19.
//

import Foundation

// MARK: - RankingsHeroes
struct PlayerCountsModel: Decodable {
    let leaverStatus, gameMode, lobbyType, laneRole: [String: GameWin]?
    let region, patch, isRadiant: [String: GameWin]?

    enum CodingKeys: String, CodingKey {
        case leaverStatus = "leaver_status"
        case gameMode = "game_mode"
        case lobbyType = "lobby_type"
        case laneRole = "lane_role"
        case region, patch
        case isRadiant = "is_radiant"
    }
}

// MARK: - GameMode
struct GameWin: Codable {
    let games, win: Int?
}
