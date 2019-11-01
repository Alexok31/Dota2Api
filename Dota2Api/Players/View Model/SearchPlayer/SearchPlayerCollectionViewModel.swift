//
//  SearchPlayerCollectionViewModel.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/29/19.
//

import Foundation

class SearchPlayerCollectionViewModel: SearchPlayerCollectionViewModelType {
    
    private var profiles : [ProfileModel]
    private var selectedIndexPath: IndexPath?
    
    var dataBaseServise : DataBaseServise?
    
    init(profiles : [ProfileModel]) {
        self.profiles = profiles
        dataBaseServise = RealmDataBaseServise()
    }
    
    var numberOfRows : Int {
        return profiles.count
    }
    
    func profileCell(for indexPath: IndexPath) -> PlayerCellViewModelType {
        let profile = profiles[indexPath.row]
        return PlayerCellViewModel(searchPlayerModel: profile)
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        selectedIndexPath = indexPath
    }
    
    func addToFavorite() {
        guard let index = selectedIndexPath else {return}
        let profile = profiles[index.row]
        dataBaseServise?.add(dataModel: profile)
    }
    
}
