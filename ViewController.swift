//
//  ViewController.swift
//  TipCalculator
//
//  Created by Nalini Shah on 7/12/17.
//  Copyright © 2017 Nalini Shah. All rights reserved.
//

import UIKit

extension Double {
    var asLocaleCurrency :String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from: self as NSNumber)!
    }
}

class ViewController: UIViewController {
   
    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var tipDisplayLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    let tipPercentages = [0.18, 0.20, 0.25]
    var tipControlIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.billText.becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        
        //Get tip%
        tipControlIndex = defaults.integer(forKey: Key.UserDefaults.tipControlIndexKey)
    
        //Display tip%
        let tip = String(tipPercentages[tipControlIndex] * 100)
        tipDisplayLabel.text = "Tip [" + tip + "%]"
        calculateTip(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        let bill = Double(billText.text!) ?? 0
        
        let tip = bill * tipPercentages[tipControlIndex]
        let total = bill + tip
        
        tipLabel.text = tip.asLocaleCurrency
        totalLabel.text = total.asLocaleCurrency
    }
}

