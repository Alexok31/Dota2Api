//
//  Coordinator.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/4/19.
//


import UIKit
 
class AppCoordinator: Coordinator {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        showTabBar()
    }
    
    func showTabBar() {
        let tabBarCoordinator = TabBarCoordinator(window: window)
        tabBarCoordinator.start()
    }
}
