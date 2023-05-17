//
//  ViewController.swift
//  ConversorDeMoedas
//
//  Created by Iphone on 30/04/23.
//

import UIKit

class ConversorVC: UIViewController {

    var screen: TelaInicialScreen?
    
    override func loadView() {
        screen = TelaInicialScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor.init(red: 12/255, green: 101/255, blue: 15/255, alpha: 100)
    }

}

extension ConversorVC: TelaInicialScreenProtocol{
    
    func actionStartButton() {
        let vc: MoedasVC = MoedasVC()
        self.navigationController?.pushViewController(vc, animated: true)
        print("Indo para a tela 2 OK")
    }
}

