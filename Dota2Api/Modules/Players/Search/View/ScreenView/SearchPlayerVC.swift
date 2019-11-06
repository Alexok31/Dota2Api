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

    @IBOutlet var playerResult: UITableView!
    @IBOutlet var selectSerchOptions: UISegmentedControl!
    @IBOutlet var closeSearchButton: UIButton!
    
    var searchPlayerViewModel : SearchPlayerViewModelType?
    var searchPlayerTableViewModel : PlayerTableViewModelType?
    
    let disposeBag = DisposeBag()
    let cellId = R.reuseIdentifier.playerTableCelId.identifier
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegister()
        subscribeObservable()
    }
    
    func cellRegister() {
        playerResult.register(UINib(resource: R.nib.playerCellTableViewCell), forCellReuseIdentifier: cellId)
    }
    
    func subscribeObservable() {
        observeSelectSerchOptions()
        observeProfilesInfo()
        observeCloseSearch()
    }
    
    func observeSelectSerchOptions() {
        _ = selectSerchOptions.rx.value.subscribe(onNext: { (index) in
            self.searchPlayerViewModel?.selectSegment(at: index)
        }).disposed(by: disposeBag)
    }
    
    func observeProfilesInfo() {
        _ = searchPlayerViewModel?.observableProfiles.asObservable().subscribe(onNext: {
            profilesInfo in
            self.searchPlayerTableViewModel = PlayerTableViewModel(profiles: profilesInfo)
            DispatchQueue.main.async {
                self.playerResult.reloadData()
            }
        }).disposed(by: disposeBag)
    }
    
    func observeCloseSearch() {
        _ = closeSearchButton.rx.tap
        .observeOn(MainScheduler.instance)
        .subscribe(onNext: {
            self.searchPlayerViewModel?.didClouseSearch.onNext(())
        }).disposed(by: disposeBag)
    }
    
    
}


