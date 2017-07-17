//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Nalini Shah on 7/12/17.
//  Copyright © 2017 Nalini Shah. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var tipControlIndex : Int = 0
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tipControlIndex = defaults.integer(forKey: Key.UserDefaults.tipControlIndexKey)
        tipControl.selectedSegmentIndex = tipControlIndex
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //Set tipPercentage
        defaults.set(tipControl.selectedSegmentIndex, forKey: Key.UserDefaults.tipControlIndexKey)
    }
}
