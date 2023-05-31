//
//  Alert.swift
//  ConversorDeMoedas
//
//  Created by Iphone on 16/05/23.
//

import UIKit

class Alert {

    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func sameCoinAlert(){
        
        let alertController: UIAlertController = UIAlertController(title: "Atenção!", message: "Selecione moedas diferentes", preferredStyle: .alert)
        let alertButton = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(alertButton)
        controller.present(alertController, animated: true)
    }
    
    func withoutValue(){
        
        let alertController: UIAlertController = UIAlertController(title: "Atenção!", message: "Digite um valor", preferredStyle: .alert)
        let alertButton = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(alertButton)
        controller.present(alertController, animated: true)
    }
    
    func withoutSegmented(){
        
        let alertController: UIAlertController = UIAlertController(title: "Atenção!", message: "Selecione as moedas", preferredStyle: .alert)
        let alertButton = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(alertButton)
        controller.present(alertController, animated: true)
    }
    
    func withoutSegmented1(){
        
        let alertController: UIAlertController = UIAlertController(title: "Atenção!", message: "Selecione a moeda a ser convertida", preferredStyle: .alert)
        let alertButton = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(alertButton)
        controller.present(alertController, animated: true)
    }
    
    func withoutSegmented2(){
        
        let alertController: UIAlertController = UIAlertController(title: "Atenção!", message: "Selecione uma moeda de destino", preferredStyle: .alert)
        let alertButton = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(alertButton)
        controller.present(alertController, animated: true)
    }

}
