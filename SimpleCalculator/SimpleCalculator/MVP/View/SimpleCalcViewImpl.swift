//
//  SimpleCalcViewImpl.swift
//  SimpleCalculator
//
//  Created by Fabrizio Piruzi on 29/01/2019.
//  Copyright © 2019 fpiruzi. All rights reserved.
//

import Foundation
import UIKit

class SimpleCalcViewImpl: UIViewController, SimpleCalcView{
    
    var presenter: SimpleCalcPresenter!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = SimpleCalcPresenterImpl<SimpleCalcViewImpl>(view: self)
        prepareInitLabel()
    }
    
    @IBAction func numberDidTap(_ sender: Any) {
        let tag: Int = (sender as AnyObject).tag!
        self.presenter.numberDidTap(tag: tag, currentText:getText())
    }
    
    @IBAction func actionDidTap(_ sender: Any) {
        let tag: Int = (sender as AnyObject).tag!
        self.presenter.actionDidTap(tag: tag, currentText:getText())
    }
    
    //Protocol func
    func showResult(result: String) {
        self.setTextInLabel(value: result)
    }
    //Protocol func
    func clearScreen() {
        self.prepareInitLabel()
    }
    //Protocol func
    func appendString(value: String){
        self.appendStringToText(value: value)
    }
    //Protocol func
    func removeLastChar() {
        self.removeLastCharFromText()
    }
    //Protocol func
    func showWarning(){
        let alertController = UIAlertController(
            title: Constants.Strings.warningTitle,
            message: Constants.Strings.warningMsg,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: Constants.Strings.ok, style: .default)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
//UI
extension SimpleCalcViewImpl{
    
    fileprivate func getText()-> String?{
        return resultLabel.text
    }
    
    fileprivate func prepareInitLabel(){
        setTextInLabel(value: Constants.Strings.zeroDotZero)
    }
    
    fileprivate func setTextInLabel(value: String){
        resultLabel.text = value
    }
    
   func appendStringToText(value: String){
        setTextInLabel(value:resultLabel.text! + value)
    }
    
    fileprivate func removeLastCharFromText(){
        if let text = resultLabel.text, !text.isEmpty {
            resultLabel.text?.removeLast()
        }else{
            prepareInitLabel()
        }
    }
}
