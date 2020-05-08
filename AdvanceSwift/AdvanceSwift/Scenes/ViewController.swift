//
//  ViewController.swift
//  AdvanceSwift
//
//  Created by Gia Han on 5/7/20.
//  Copyright © 2020 vn.netstars. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    
    weak var coordinator: (BuyingProtocol & AccountProtocol)?
    @IBOutlet weak var segmentProduct: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buyTapped(_ sender: Any) {
        coordinator?.buySubscription(to: segmentProduct.selectedSegmentIndex)
    }
    
    @IBAction func createTapped(_ sender: Any) {
        coordinator?.createAccount()
    }
    
}

