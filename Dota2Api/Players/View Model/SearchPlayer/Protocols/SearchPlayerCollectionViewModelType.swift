//
//  SearchPlayerCollectionViewModelType.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/1/19.
//

import Foundation

protocol SearchPlayerCollectionViewModelType {
    var numberOfRows : Int {get}
    func profileCell(for indexPath: IndexPath) -> PlayerCellViewModelType
    func selectRow(atIndexPath indexPath: IndexPath)
    func addToFavorite()
}
