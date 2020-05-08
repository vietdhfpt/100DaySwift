//
//  CreateCoordinator.swift
//  AdvanceSwift
//
//  Created by Gia Han on 5/8/20.
//  Copyright © 2020 Miu. All rights reserved.
//

import UIKit

class CreateCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        NSLog("Deinit CreateCoordinator")
    }
    
    func start() {
        let vc = CreateViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}
