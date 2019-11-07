//
//  File.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/7/19.
//

import Foundation

// MARK: - PlayerPlayHero
struct PlayerPlayHero: Codable {
    let heroID: String?
    let lastPlayed, games, win, withGames: Int?
    let withWin, againstGames, againstWin: Int?

    enum CodingKeys: String, CodingKey {
        case heroID = "hero_id"
        case lastPlayed = "last_played"
        case games, win
        case withGames = "with_games"
        case withWin = "with_win"
        case againstGames = "against_games"
        case againstWin = "against_win"
    }
}

typealias PlayerPlayHeroes = [PlayerPlayHero]
