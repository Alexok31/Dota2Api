//
//  Coordinator.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/4/19.
//

import UIKit
 
class AppCoordinator: Coordinator {
    
    let window: UIWindow
    var downloadConstrainsServise : DownloadConstrainsServise
    
    init(window: UIWindow) {
        self.window = window
        downloadConstrainsServise = DownloadToRealmConstrainsServise()
    }
    
    func start() {
        showTabBar()
    }
    
    func showTabBar() {
        downloadConstrainsServise.heroStats()
        let tabBarCoordinator = TabBarCoordinator(window: window)
        tabBarCoordinator.start()
    }
}
