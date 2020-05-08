//
//  ViewController.swift
//  AdvanceSwift
//
//  Created by Gia Han on 5/7/20.
//  Copyright © 2020 vn.netstars. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    
    var buyingClosureAction: (() -> Void)?
    var createAccountClosureAction: (() -> Void)?
    
    @IBOutlet weak var segmentProduct: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buyTapped(_ sender: Any) {
        buyingClosureAction?()
    }
    
    @IBAction func createTapped(_ sender: Any) {
        createAccountClosureAction?()
    }
    
}

