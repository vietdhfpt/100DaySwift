//
//  MainTabBarViewController.swift
//  AdvanceSwift
//
//  Created by Gia Han on 5/8/20.
//  Copyright © 2020 Miu. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    let main = MainCoordinator(navigationController: UINavigationController())

    override func viewDidLoad() {
        super.viewDidLoad()
        main.start()
        viewControllers = [main.navigationController]
    }

}
