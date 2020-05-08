//
//  BuyViewController.swift
//  AdvanceSwift
//
//  Created by Gia Han on 5/7/20.
//  Copyright © 2020 Miu. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController, Storyboarded {
    
    weak var coordinator: BuyCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("Deinit BuyViewController")
    }
}
