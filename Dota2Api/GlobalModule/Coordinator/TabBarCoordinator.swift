//
//  TabBarCoordinator.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/5/19.
//

import Foundation

import UIKit

class TabBarCoordinator : Coordinator {
    
    let window: UIWindow
    let tabBarController = UITabBarController()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let profileCoordinator = FavoritePlayersCoordinator()
        profileCoordinator.start()
        
        tabBarController.setViewControllers([profileCoordinator.navigationController], animated: false)
        window.rootViewController = tabBarController
    }
}
