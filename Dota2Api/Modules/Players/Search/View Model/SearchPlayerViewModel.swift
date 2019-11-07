//
//  PlayerViewModel.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/28/19.
//

import Foundation
import RxSwift
import RxCocoa

class SearchPlayerViewModel: SearchPlayerViewModelType {
    
    private let searchPlayerServise : SearchPlayerApiServise
    private let playerDetails: PlayerDetailsApiServise
    private var searchPlayer = [ProfileModel]()
    private var selectSegmentIndex : SearchByType
    
    var observableProfiles: BehaviorRelay<[ProfileModel]>
    
    //event
    var didClouseSearch = PublishSubject<Void>()
    
    enum SearchByType: Int {
        case name = 0
        case id
    }
    
    init(searchPlayerServise: SearchPlayerApiServise, playerDetails: PlayerDetailsApiServise) {
        self.searchPlayerServise = searchPlayerServise
        self.playerDetails = playerDetails
        selectSegmentIndex = .name
        observableProfiles = BehaviorRelay(value: searchPlayer)
    }
    
    func selectSegment(at index : Int) {
        guard let searchByType = SearchByType(rawValue: index) else {return}
        self.selectSegmentIndex = searchByType
    }
    
    private func searchPlayerByUserName(name: String) {
        searchPlayerServise.byUserName(name) { (result, profile) in
            if let profile = profile {
                self.observableProfiles.accept(profile)
            }
        }
    }
    
    private func searchPlayerByID(id: String) {
        playerDetails.getInfo(path: .getPlayer(id: id), modelType: PlayerInfo.self) { (result, profile) in
            if let profile = profile?.profile {
                self.observableProfiles.accept([profile])
            }
        }
    }
    
    func getPlayersInfo(searchText: String) {
        switch selectSegmentIndex {
        case .name:
            searchPlayerByUserName(name: searchText)
        case .id:
            searchPlayerByID(id: searchText)
        }
    }
}
