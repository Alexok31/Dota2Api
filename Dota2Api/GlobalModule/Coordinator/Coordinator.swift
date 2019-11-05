//
//  Coordinator.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/5/19.
//

import UIKit

protocol Coordinator {
    func start()
    func stop()
}

protocol DefaultCoordinator: Coordinator {
    var navigationController: UINavigationController { get set }
    var viewController : UIViewController? { get set }
}

extension Coordinator {
    func stop() {
    
    }
}
