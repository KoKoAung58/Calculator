//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Ob yda on 6/11/24.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "AC" {
                return n * 0
            } else if symbol == "%" {
                return n / 100
            }  else if symbol == "=" {
                return performTwoNumCalc(n2: n)
            }else {
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalc(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+" :
                return n1 + n2
            case "-" :
                return n1 - n2
            case "x" :
                return n1 * n2
            case "÷" :
                return n1 / n2
            default:
                fatalError("The operation doesn't exit")
            }
        }
      return nil
    }
}
