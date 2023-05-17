//
//  MoedasVC.swift
//  ConversorDeMoedas
//
//  Created by Iphone on 30/04/23.
//

import UIKit

class MoedasVC: UIViewController {

    var screen: MoedasScreen?
    
    override func loadView() {
        screen = MoedasScreen()
        view = screen        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }

}

extension MoedasVC: MoedasScreenProtocol {
    func actionConvertButton() {
        
        if screen?.coinSegmented.selectedSegmentIndex == screen?.coinSegmented2.selectedSegmentIndex {
            print("Mesma moeda")
            //            screen.sameCoinAlert()
        }
        
//        else if valueTextField.text == 0

        else if screen?.coinSegmented.selectedSegmentIndex == 0 && screen?.coinSegmented2.selectedSegmentIndex == 1 {
            let valueString = screen?.valueTextField.text
            let valueDouble = NSString(string: valueString!).doubleValue
            let result = valueDouble * (MoedasScreen.Money.dolarToReal.rawValue)
            screen?.resultLabel.text = String(format:"R$" + "%.2f", result) as String
            
        } else if screen?.coinSegmented.selectedSegmentIndex == 0 && screen?.coinSegmented2.selectedSegmentIndex == 2 {
            let valueString = screen?.valueTextField.text
            let valueDouble = NSString(string: valueString!).doubleValue
            let result = valueDouble * (MoedasScreen.Money.dolarToEuro.rawValue)
            screen?.resultLabel.text = String(format:"€" + "%.2f", result) as String

        } else if screen?.coinSegmented.selectedSegmentIndex == 1 && screen?.coinSegmented2.selectedSegmentIndex == 0 {
            let valueString = screen?.valueTextField.text
            let valueDouble = NSString(string: valueString!).doubleValue
            let result = valueDouble * (MoedasScreen.Money.realToDolar.rawValue)
            screen?.resultLabel.text = String(format:"US$" + "%.2f", result) as String

        } else if screen?.coinSegmented.selectedSegmentIndex == 1 && screen?.coinSegmented2.selectedSegmentIndex == 2 {
            let valueString = screen?.valueTextField.text
            let valueDouble = NSString(string: valueString!).doubleValue
            let result = valueDouble * (MoedasScreen.Money.realToEuro.rawValue)
            screen?.resultLabel.text = String(format:"€" + "%.2f", result) as String

        } else if screen?.coinSegmented.selectedSegmentIndex == 2 && screen?.coinSegmented2.selectedSegmentIndex == 0 {
            let valueString = screen?.valueTextField.text
            let valueDouble = NSString(string: valueString!).doubleValue
            let result = valueDouble * (MoedasScreen.Money.euroToDolar.rawValue)
            screen?.resultLabel.text = String(format:"US$" + "%.2f", result) as String

        } else if screen?.coinSegmented.selectedSegmentIndex == 2 && screen?.coinSegmented2.selectedSegmentIndex == 1 {
            let valueString = screen?.valueTextField.text
            let valueDouble = NSString(string: valueString!).doubleValue
            let result = valueDouble * (MoedasScreen.Money.euroToReal.rawValue)
            screen?.resultLabel.text = String(format:"R$" + "%.2f", result) as String
        }

    }
    
}
