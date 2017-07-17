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
    var bill : Double = 0.00
    var persistedBillAmount : Double = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPersistedBillAmount()
        self.billText.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //Set application kill time
        UserDefaults.standard.set(Date(), forKey:Key.UserDefaults.appKillDateTime)
        
        //Persist bill amount
        defaults.set(Double(billText.text!), forKey: Key.UserDefaults.billAmount)
        UserDefaults.standard.synchronize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

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
        let bill = Double(billText.text!) ?? persistedBillAmount
        
        let tip = bill * tipPercentages[tipControlIndex]
        let total = bill + tip
        
        tipLabel.text = tip.asLocaleCurrency
        totalLabel.text = total.asLocaleCurrency
    }
    
    func getPersistedBillAmount()
    {
        //Get persisted date
        let appKillDate = defaults.object(forKey: Key.UserDefaults.appKillDateTime) as? Date
        let seconds =  Date().seconds(from: appKillDate!)
        if (seconds > 0) && (seconds < 10 * 60)
        {
            persistedBillAmount = defaults.double(forKey: Key.UserDefaults.billAmount)
            if (persistedBillAmount > 0.00)
            {
                //display persisted bill amount
                billText.text = persistedBillAmount.asLocaleCurrency
            }
        }
    }
}

