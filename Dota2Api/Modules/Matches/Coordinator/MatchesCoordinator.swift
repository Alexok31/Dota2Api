//
//  File.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/5/19.
//

import Foundation
import UIKit

class MatchesCoordinator: DefaultCoordinator {
    
    var viewController: UIViewController?
    
    var navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController(rootViewController: R.storyboard.matches.matchesID()!)
        self.viewController = navigationController.topViewController as? MatchesVC
    }
    
    func start() {
        
    }
}
