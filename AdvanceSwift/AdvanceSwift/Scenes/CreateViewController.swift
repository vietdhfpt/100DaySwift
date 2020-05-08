//
//  CreateViewController.swift
//  AdvanceSwift
//
//  Created by Gia Han on 5/7/20.
//  Copyright © 2020 Miu. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, Storyboarded {
    
    weak var coordinator: CreateCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("Deinit CreateViewController")
    }
}
