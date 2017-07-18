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

extension Date {
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipDisplayLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    let tipPercentages = [0.18, 0.20, 0.25]
    var tipControlIndex : Int = 0
    let defaults = UserDefaults.standard
    var persistedBillAmount : Double = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Display persisted bill amount if app restarted within 10mins
        getPersistedBillAmount()
        
        //Ensure user can start typing bill amount when application launched
        self.billText.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //Set application kill time
        defaults.set(Date(), forKey:Key.UserDefaults.appKillDateTime)
        
        //Persist bill amount
        defaults.set(Double(billText.text!), forKey: Key.UserDefaults.billAmount)
        
        //Synchronize UserDefaults
        defaults.synchronize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        //Get stored tip%
        tipControlIndex = defaults.integer(forKey: Key.UserDefaults.tipControlIndexKey)
    
        let tip = String(tipPercentages[tipControlIndex] * 100)
        
        //Display selected tip%
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
        let bill = Double(billText.text!) ?? persistedBillAmount
        let tip = bill * tipPercentages[tipControlIndex]
        let total = bill + tip
        
        //Display tip as locale currency
        tipLabel.text = tip.asLocaleCurrency
        
        //Display total as locale currency
        totalLabel.text = total.asLocaleCurrency
    }
    
    fileprivate func getPersistedBillAmount() {
        //Get persisted date
        let appKillDate = defaults.object(forKey: Key.UserDefaults.appKillDateTime) as? Date
        let seconds =  Date().seconds(from: appKillDate!)
        
        //Check if app restarted within 10 minutes
        if (seconds > 0) && (seconds < 10 * 60) {
            persistedBillAmount = defaults.double(forKey: Key.UserDefaults.billAmount)
            if (persistedBillAmount > 0.00) {
                //Display persisted bill amount
                billText.text = persistedBillAmount.asLocaleCurrency
            }
        }
    }
}

