//
//  ViewController.swift
//  ConversorDeMoedas
//
//  Created by Iphone on 30/04/23.
//

import UIKit

class HomeVC: UIViewController {

    var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor.init(red: 12/255, green: 101/255, blue: 15/255, alpha: 100)
    }
}

extension HomeVC: HomeScreenProtocol{
    
    func actionStartButton() {
        let vc: CalculatorVC = CalculatorVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

