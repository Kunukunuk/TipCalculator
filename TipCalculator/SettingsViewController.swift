//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Kun Huang on 9/12/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UINavigationControllerDelegate {
    
    var tipPercentage = 0.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        print("am i here?")
        (viewController as? ViewController)?.tipPercentage = tipPercentage
        print("\((viewController as? ViewController)?.tipPercentage)")
    }
    
    @IBAction func textDidChange(_ sender: UITextField) {
        let inDecimal = (Double(sender.text!)!)/100.0
        tipPercentage = inDecimal
        print(tipPercentage)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
