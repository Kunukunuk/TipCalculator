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
        print("tip Percentage \(tipPercentage)")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func setTip(_ sender: UIButton) {
        
        tipPercentage = Double(enteredTip.text!)! / 100
        enteredTip.text = String(Int(tipPercentage * 100))
        view.endEditing(true)
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
                if !(amountString.count == 0) {
                    if amountString.count <= 1 {
                        amountString = String(amountString.prefix(amountString.count-1))
                        displayAmount(bill: 0.0)
                    } else {
                        amountString = String(amountString.prefix(amountString.count-1))
                        amountDouble = Double(amountString)!
                        displayAmount(bill: amountDouble)
                    }
                }
            case ".":
                if !amountString.contains(".") {
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
        let locale = Locale.current
        //let currencySymbol = locale.currencySymbol!
        let currencyCode = locale.currencyCode!
        
        let currencyFormat = NumberFormatter()
        currencyFormat.usesGroupingSeparator = true
        currencyFormat.numberStyle = .currency
        currencyFormat.locale = locale
        let price = currencyFormat.string(from: NSNumber(value: amount))!
        let tipPrice = currencyFormat.string(from: NSNumber(value: amount * tipPercentage))!
        let totalPrice = currencyFormat.string(from: NSNumber(value: amount * (1 + tipPercentage)))!
        
        billAmount.text = "Bill Amount: \(currencyCode) \(price)"
        tipAmount.text = "Tip Amount: \(currencyCode) \(tipPrice)"
        totalAmount.text = "Total Bill: \(currencyCode) \(totalPrice)"
        
        /*if amountString.contains(".") {
            billAmount.text = "Bill Amount: \(currencyCode) \(currencySymbol) " + String(amount)
            tipAmount.text = "Tip Amount: " + String(amount * tipPercentage)
            totalAmount.text = "Total Bill: \(currencyCode) \(currencySymbol) " + String(amount * (1 + tipPercentage))
        } else {
            billAmount.text = "Bill Amount: \(currencyCode) \(currencySymbol) " + String(Int(amount))
            tipAmount.text = "Tip Amount: " + String(Int(amount * tipPercentage))
            totalAmount.text = "Total Bill: \(currencyCode) \(currencySymbol) " + String(Int(amount * (1 + tipPercentage)))
        }*/
        
    }
    
}

