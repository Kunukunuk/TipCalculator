//
//  ViewController.swift
//  TipCalculator
//
//  Created by Kun Huang on 9/12/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmount: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    var amountString = ""
    var tipPercentage = 0.20
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var enteredTip: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func setTip(_ sender: UIButton) {
        
        tipPercentage = Double(enteredTip.text!)! / 100
        enteredTip.text = String(tipPercentage * 100)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let digit = sender.currentTitle
        var amountDouble = 0.0
        switch digit {
            case "⌫":
                if amountString.count <= 1 {
                    amountString = String(amountString.prefix(amountString.count-1))
                    displayAmount(bill: 0.0)
                } else {
                    amountString = String(amountString.prefix(amountString.count-1))
                    amountDouble = Double(amountString)!
                    displayAmount(bill: amountDouble)
                }
            case ".":
                if amountString.count == 0 {
                    displayAmount(bill: 0.0)
                } else {
                    amountString += digit!
                    amountDouble = Double(amountString)!
                    displayAmount(bill: amountDouble)
                }
            default:
                amountString += digit!
                amountDouble = Double(amountString)!
                displayAmount(bill: amountDouble)
        }
        
    }
    
    func displayAmount(bill amount: Double) {
        billAmount.text = String(amount)
        tipAmount.text = String(amount * tipPercentage)
        totalAmount.text = String(amount * (1 + tipPercentage))
        
    }
}

