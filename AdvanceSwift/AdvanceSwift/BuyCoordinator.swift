//
//  BuyCoordinator.swift
//  AdvanceSwift
//
//  Created by Gia Han on 5/7/20.
//  Copyright © 2020 Miu. All rights reserved.
//

import UIKit

class BuyCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        NSLog("Deinit BuyCoordinator")
    }
    
    func start() {
        let vc = BuyViewController.instantiate()
        vc.buyCoordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showDetail() {
        let buyDetailViewController = BuyDetailViewController.instantiate()
        navigationController.pushViewController(buyDetailViewController, animated: true)
    }
}
