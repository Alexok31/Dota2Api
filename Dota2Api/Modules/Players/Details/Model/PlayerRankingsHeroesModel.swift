//
//  RankingsHeroesModel.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/7/19.
//

import Foundation

import Foundation

// MARK: - RankingsHero
struct PlayerRankingsHeroesModel: Decodable {
    let heroID: Int?
    let score, percentRank: Double?
    let card: Int?

    enum CodingKeys: String, CodingKey {
        case heroID = "hero_id"
        case score
        case percentRank = "percent_rank"
        case card
    }
}

typealias PlayerRankingsHeroes = [PlayerRankingsHeroesModel]
