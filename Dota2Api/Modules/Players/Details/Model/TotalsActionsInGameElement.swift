//
//  File.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/7/19.
//

import Foundation

// MARK: - TotalsActionsInGameElement
struct TotalsActionsInGameElement: Codable {
    let field: String
    let n: Int
    let sum: Double
}

typealias TotalsActionsInGame = [TotalsActionsInGameElement]
