//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTyping : Bool = true
    private var calculator = CalculatorLogic()
    
    private var displayValue: Double {
        get{
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label to a Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTyping = true
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            guard let result = calculator.calculate(symbol: calcMethod) else {
                fatalError("The result of the calculation is nil")
            }
            displayValue = result
        }
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if isFinishedTyping{
                displayLabel.text = numValue
                isFinishedTyping = false
            } else{
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt{
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }

}

