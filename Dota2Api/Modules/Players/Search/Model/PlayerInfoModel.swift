//
//  SearchPlayerModel.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/28/19.
//

struct PlayerInfo: Decodable {
    let trackedUntil: String?
    let rankTier, soloCompetitiveRank, competitiveRank: Int?
    let leaderboardRank : Int?
    let profile: ProfileModel?

    enum CodingKeys: String, CodingKey {
        case trackedUntil = "tracked_until"
        case rankTier = "rank_tier"
        case soloCompetitiveRank = "solo_competitive_rank"
        case competitiveRank = "competitive_rank"
        case leaderboardRank = "leaderboard_rank"
        case profile = "profile"
    }
}
