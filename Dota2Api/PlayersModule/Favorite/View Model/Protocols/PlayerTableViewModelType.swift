//
//  SearchPlayerCollectionViewModelType.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/1/19.
//

import Foundation
import RxSwift

protocol PlayerTableViewModelType {
    var numberOfRows : Int {get}
    func profileCell(for indexPath: IndexPath) -> PlayerCellViewModelType
    func selectRow(atIndexPath indexPath: IndexPath)
    func addToFavorite()
    func removeFromFavorite()
    func playerDetails() -> PlayerDetailsViewModelType?
    var didOpenPlayerDetails : PublishSubject<Void> {get}
    
}
