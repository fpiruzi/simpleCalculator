//
//  SimpleCalcPresenterImpl.swift
//  SimpleCalculator
//
//  Created by Fabrizio Piruzi on 29/01/2019.
//  Copyright © 2019 fpiruzi. All rights reserved.
//

import Foundation

class SimpleCalcPresenterImpl<T: SimpleCalcView>:SimpleCalcPresenter {

    weak var view : T?
    var operations = [OperationModel]()
    
    enum OperationType: Int {
        case decimal = -1
        case equal = -2
        case sum = -3
        case sub = -4
        case mul = -5
        case div = -6
        case c = -7
        case ac = -8
    }
    
    required init(view: T) {
        self.view = view
    }
    
    func numberDidTap(tag:Int, currentText: String?) {
        self.checkInitialFlow(currentText: currentText)
        self.view?.appendString(value: String(tag))
    }
    
    func actionDidTap(tag: Int, currentText: String?) {
        
        let comparable = OperationType.init(rawValue: tag)
        
        switch comparable! {
            case OperationType.decimal:
                decimalDidTap(currentText: currentText)
                break
            case OperationType.equal:
                let operationModel = math(expresion: currentText!)
                self.operations.append(operationModel)//History
                self.view?.showResult(result: String(operationModel.result))
                break
            case OperationType.sum:
                addOperationStringToText(currentText: currentText!, operatorSymbol: Constants.Strings.sum)
                break
            case OperationType.sub:
                addOperationStringToText(currentText: currentText!, operatorSymbol: Constants.Strings.sub)
                break
            case OperationType.mul:
                addOperationStringToText(currentText: currentText!, operatorSymbol: Constants.Strings.mul)
                break
            case OperationType.div:
                addOperationStringToText(currentText: currentText!, operatorSymbol: Constants.Strings.div)
                break
            case OperationType.c:
                self.view?.removeLastChar()
                break
            case OperationType.ac:
                self.view?.clearScreen()
                break
        }
    }
}

extension SimpleCalcPresenterImpl{
    
    fileprivate func checkInitialFlow(currentText: String?){
        if let text = currentText, text == Constants.Strings.zeroDotZero{
            self.view?.showResult(result: Constants.Strings.empty)
        }
    }
    
    fileprivate func decimalDidTap(currentText: String?) {
        if lastCharIsNumber(currentText: currentText!){
            self.view?.appendString(value: Constants.Strings.dot)
        }
    }
    
    fileprivate func lastCharIsNumber(currentText: String?) -> Bool{
        guard let text = currentText, text != Constants.Strings.zeroDotZero && !text.isEmpty else {
            return false
        }
        return CharacterSet.decimalDigits.contains(text.unicodeScalars.last!)
    }
    
    fileprivate func addOperationStringToText(currentText:String, operatorSymbol: String){
        if lastCharIsNumber(currentText: currentText){
            self.view?.appendString(value:operatorSymbol)
        }
    }
    
    fileprivate func math(expresion: String)-> OperationModel{
        var mathValue = 0.0
        if expresion != Constants.Strings.zeroDotZero && !expresion.isEmpty && lastCharIsNumber(currentText: expresion){
            if let result = NSExpression(format: expresion).expressionValue(with: nil, context: nil) as? Double{
                mathValue = result
            }else{
                print("failed")
            }
        }
        
        return OperationModel(mathExpression:NSExpression(format: expresion), result:mathValue)
    }
}
