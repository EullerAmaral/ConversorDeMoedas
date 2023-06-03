//
//  MoedasVC.swift
//  ConversorDeMoedas
//
//  Created by Iphone on 30/04/23.
//

import UIKit

class CalculatorVC: UIViewController {

    var screen: CalculatorScreen?
    var alert: Alert?
    var coinValue: CoinValue?
    
    override func loadView() {
        screen = CalculatorScreen()
        view = screen        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        alert = Alert(controller: self)
        coinValue = CoinValue()
        self.dismissKeyboard()
    }
}

extension CalculatorVC: CalculatorScreenProtocol {
    func actionConvertButton() {
        
        let valueString = screen?.valueTextField.text
        let valueDouble = NSString(string: valueString!).doubleValue
        
        if screen?.valueTextField.text?.isEmpty == true || valueDouble == 0 {
            alert?.withoutValue()
            
        } else if screen?.coinSegmented.selectedSegmentIndex == -1 && screen?.coinSegmented2.selectedSegmentIndex == -1 {
            alert?.withoutSegmented()
        }
        
        else if screen?.coinSegmented.selectedSegmentIndex == screen?.coinSegmented2.selectedSegmentIndex {
            alert?.sameCoinAlert()
            
        } else if screen?.coinSegmented.selectedSegmentIndex == 0 && screen?.coinSegmented2.selectedSegmentIndex == 1 {
            let valueString = screen?.valueTextField.text
            let valueDouble = NSString(string: valueString!).doubleValue
            let result = valueDouble * CoinValue.Money.dolarToReal.rawValue
            screen?.resultLabel.text = String(format:"R$" + "%.2f", result) as String
            
        } else if screen?.coinSegmented.selectedSegmentIndex == 0 && screen?.coinSegmented2.selectedSegmentIndex == 2 {
            let valueString = screen?.valueTextField.text
            let valueDouble = NSString(string: valueString!).doubleValue
            let result = valueDouble * CoinValue.Money.dolarToEuro.rawValue
            screen?.resultLabel.text = String(format:"€" + "%.2f", result) as String

        } else if screen?.coinSegmented.selectedSegmentIndex == 1 && screen?.coinSegmented2.selectedSegmentIndex == 0 {
            let valueString = screen?.valueTextField.text
            let valueDouble = NSString(string: valueString!).doubleValue
            let result = valueDouble * CoinValue.Money.realToDolar.rawValue
            screen?.resultLabel.text = String(format:"US$" + "%.2f", result) as String

        } else if screen?.coinSegmented.selectedSegmentIndex == 1 && screen?.coinSegmented2.selectedSegmentIndex == 2 {
            let valueString = screen?.valueTextField.text
            let valueDouble = NSString(string: valueString!).doubleValue
            let result = valueDouble * CoinValue.Money.realToEuro.rawValue
            screen?.resultLabel.text = String(format:"€" + "%.2f", result) as String

        } else if screen?.coinSegmented.selectedSegmentIndex == 2 && screen?.coinSegmented2.selectedSegmentIndex == 0 {
            let valueString = screen?.valueTextField.text
            let valueDouble = NSString(string: valueString!).doubleValue
            let result = valueDouble * CoinValue.Money.euroToDolar.rawValue
            screen?.resultLabel.text = String(format:"US$" + "%.2f", result) as String

        } else if screen?.coinSegmented.selectedSegmentIndex == 2 && screen?.coinSegmented2.selectedSegmentIndex == 1 {
            let valueString = screen?.valueTextField.text
            let valueDouble = NSString(string: valueString!).doubleValue
            let result = valueDouble * CoinValue.Money.euroToReal.rawValue
            screen?.resultLabel.text = String(format:"R$" + "%.2f", result) as String
        }
    }
}

extension CalculatorVC {
    func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CalculatorVC.dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
        view.endEditing(true)
    }
}
