//
//  ViewController.swift
//  TipCalculator
//
//  Created by Nalini Shah on 7/12/17.
//  Copyright © 2017 Nalini Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
   
    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var tipDisplayLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    let tipPercentages = [0.18, 0.20, 0.25]
    var tipControlIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.billText.delegate = self;
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
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    //Ensure only numbers and decimals are accepted when typing via keyboard
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let components = string.components(separatedBy: inverseSet)
        let filtered = components.joined(separator: "")
        
        if filtered == string {
            return true
        } else {
            if string == "." {
                let countdots = textField.text!.components(separatedBy:".").count - 1
                if countdots == 0 {
                    return true
                }else{
                    if countdots > 0 && string == "." {
                        return false
                    } else {
                        return true
                    }
                }
            }else{
                return false
            }
        }
    }
}

