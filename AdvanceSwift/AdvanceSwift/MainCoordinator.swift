//
//  MainCoordinator.swift
//  AdvanceSwift
//
//  Created by Gia Han on 5/7/20.
//  Copyright © 2020 Miu. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var buyCoordinator: BuyCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        NSLog("Deinit main coordinator")
    }

    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func buySubscription() {
        let buyCoordinator = BuyCoordinator(navigationController: navigationController)
        self.buyCoordinator = buyCoordinator
        buyCoordinator.start()
    }

    func createAccount() {
        let vc = CreateViewController.instantiate()
        navigationController.pushViewController(vc, animated: true)
    }
}
