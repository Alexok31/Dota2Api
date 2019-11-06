//
//  SearchPlayerViewModelType.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/1/19.
//

import Foundation
import RxCocoa
import RxSwift

protocol SearchPlayerViewModelType {
    func selectSegment(at index : Int)
    func getPlayersInfo(searchText: String)
    var observableProfiles: BehaviorRelay<[ProfileModel]> {get set}
    var didClouseSearch : PublishSubject<Void> {get}
}
