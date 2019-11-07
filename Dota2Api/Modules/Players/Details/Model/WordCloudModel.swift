//
//  WordCloudModel.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/7/19.
//

import Foundation

// MARK: - RankingsHeroes
struct PlayerWordCloudModel: Decodable {
    let myWordCounts, allWordCounts: [String: Int]?

    enum CodingKeys: String, CodingKey {
        case myWordCounts = "my_word_counts"
        case allWordCounts = "all_word_counts"
    }
}
