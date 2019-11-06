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
    
    private let playerServise : PlayerApiServise
    private var searchPlayer = [ProfileModel]()
    private var selectSegmentIndex : SearchByType
    
    var observableProfiles: BehaviorRelay<[ProfileModel]>
    
    //event
    var didClouseSearch = PublishSubject<Void>()
    
    enum SearchByType: Int {
        case name = 0
        case id
    }
    
    init(playerServise: PlayerApiServise) {
        self.playerServise = playerServise
        selectSegmentIndex = .name
        observableProfiles = BehaviorRelay(value: searchPlayer)
    }
    
    func selectSegment(at index : Int) {
        guard let searchByType = SearchByType(rawValue: index) else {return}
        self.selectSegmentIndex = searchByType
    }
    
    func getPlayersInfo(searchText: String) {
        switch selectSegmentIndex {
        case .name:
            playerServise.searchUserName(userName: searchText) { (result, profile) in
                if let profile = profile {
                    self.observableProfiles.accept(profile)
                }
            }
        case .id:
            playerServise.getPlayer(byID: searchText) { (result, playerInfo) in
                if let profile = playerInfo?.profile {
                    self.observableProfiles.accept([profile])
                }
            }
        }
    }
}
