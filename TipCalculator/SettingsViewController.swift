//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Kun Huang on 9/14/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var enterTip: UITextField!
    var tipPercentage = 0.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.delegate = self
        
        enterTip.text = String(Int(tipPercentage * 100))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setTipAmount(_ sender: Any) {
        
        tipPercentage = Double(enterTip.text!)! / 100
        enterTip.text = String(Int(tipPercentage * 100))
        view.endEditing(true)
        
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
    
        (viewController as? ViewController)?.tipPercentage = tipPercentage
        (viewController as? ViewController)?.tipPercentageLabel.text = "\(tipPercentage * 100)"
        let price = (viewController as? ViewController)?.amountString
        (viewController as? ViewController)?.displayAmount(bill: Double(price!)!)
        
    }
}
