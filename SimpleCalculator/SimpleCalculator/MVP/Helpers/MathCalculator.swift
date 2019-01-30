//
//  MathCalculator.swift
//  SimpleCalculator
//
//  Created by Fabrizio Piruzi on 30/01/2019.
//  Copyright © 2019 fpiruzi. All rights reserved.
//

import Foundation
import Expression

class MathCalculator {
    
    static let sharedInstance = MathCalculator()
    
    func performCalc(expression: String)-> Double?{
        let exp = Expression(expression)
        do {
            return try exp.evaluate()
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
}
