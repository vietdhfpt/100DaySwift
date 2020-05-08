//
//  MainCoordinator.swift
//  AdvanceSwift
//
//  Created by Gia Han on 5/7/20.
//  Copyright © 2020 Miu. All rights reserved.
//

import UIKit

protocol BuyingProtocol: AnyObject {
    func buySubscription(to productType: Int)
}

protocol AccountProtocol: AnyObject {
    func createAccount()
}

class MainCoordinator: NSObject, Coordinator, BuyingProtocol, AccountProtocol {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        NSLog("Deinit main coordinator")
    }

    func start() {
        navigationController.delegate = self
        let vc = ViewController.instantiate()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func buySubscription(to productType: Int) {
        let buyCoordinator = BuyCoordinator(navigationController: navigationController)
        buyCoordinator.selectedProduct = productType
        buyCoordinator.parentCoordinator = self
        childCoordinators.append(buyCoordinator)
        buyCoordinator.start()
    }

    func createAccount() {
        let createCoordinator = CreateCoordinator(navigationController: navigationController)
        childCoordinators.append(createCoordinator)
        createCoordinator.start()
    }
}

// MARK: UINavigationControllerDelegate
extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        if let buyViewController = fromViewController as? BuyViewController {
            childDidFinish(buyViewController.coordinator)
        }
    }
}
