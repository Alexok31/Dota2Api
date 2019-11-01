//
//  SearchPlayerVC.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/28/19.
//

import UIKit
import RxSwift
import RxCocoa

class SearchPlayerVC: UIViewController {

    @IBOutlet var playerResult: UICollectionView!
    @IBOutlet var selectSerchOptions: UISegmentedControl!
    
    var searchPlayerViewModel : SearchPlayerViewModelType?
    var searchPlayerCollectionViewModel : SearchPlayerCollectionViewModelType?
    
    let bag = DisposeBag()
    let cellId = R.reuseIdentifier.playerCellID.identifier
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchPlayerViewModel = SearchPlayerViewModel()
        cellRegister()
        observeSelectSerchOptions()
        observeProfilesInfo()
    }
    
    func observeSelectSerchOptions() {
        _ = selectSerchOptions.rx.value.subscribe(onNext: { (index) in
            self.searchPlayerViewModel?.selectSegment(at: index)
        }).disposed(by: bag)
    }
    
    func observeProfilesInfo() {
        _ = searchPlayerViewModel?.observableProfiles.asObservable().subscribe(onNext: {
            profilesInfo in
            self.searchPlayerCollectionViewModel = SearchPlayerCollectionViewModel(profiles: profilesInfo)
            DispatchQueue.main.async {
                self.playerResult.reloadData()
            }
        }).disposed(by: bag)
    }
    
    func cellRegister() {
        playerResult.register(UINib(resource: R.nib.playerCellCollectionViewCell), forCellWithReuseIdentifier: cellId)
    }
    
}


