//
//  SimpleCalcMVP.swift
//  SimpleCalculator
//
//  Created by Fabrizio Piruzi on 29/01/2019.
//  Copyright © 2019 fpiruzi. All rights reserved.
//

import Foundation

protocol SimpleCalcView: class { 
    func showResult(result:String)
    func clearScreen()
    func appendString(value: String)
    func removeLastChar()
}

protocol SimpleCalcPresenter{
    func numberDidTap(tag:Int, currentText: String?)
    func actionDidTap(tag:Int, currentText: String?)
}
