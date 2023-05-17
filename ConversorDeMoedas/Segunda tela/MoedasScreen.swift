//
//  MoedasScreen.swift
//  ConversorDeMoedas
//
//  Created by Iphone on 30/04/23.
//

import UIKit

protocol MoedasScreenProtocol: AnyObject {
    func actionConvertButton()
}

class MoedasScreen: UIView {

    weak var delegate: MoedasScreenProtocol?
    func delegate(delegate: MoedasScreenProtocol?) {
        self.delegate = delegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configAddSubview()
        configConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var items = ["Dólar", "Real", "Euro"]
    var item2 = ["Dólar", "Real", "Euro"]
    
    enum Money: Double {
        case dolarToReal = 5.99
        case realToDolar = 0.20
        case euroToReal = 5.5
        case realToEuro = 0.18
        case dolarToEuro = 0.91
        case euroToDolar = 1.10
    }
    
    lazy var backImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Home")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Valor a ser convertido:"
        label.textColor = UIColor(red: 12/255, green: 101/255, blue: 15/255, alpha: 100)
        return label
    }()
    
    lazy var valueTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.placeholder = "Digite um valor"
        textField.textColor = .gray
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.layer.borderColor = UIColor(red: 12/255, green: 101/255, blue: 15/255, alpha: 100).cgColor
        textField.layer.borderWidth = 0.3

        return textField
    }()
    
    lazy var fromLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "De:"
        label.textColor = UIColor(red: 12/255, green: 101/255, blue: 15/255, alpha: 100)
        return label
    }()
    
    lazy var coinSegmented: UISegmentedControl = {
        let segmented = UISegmentedControl(items: items)
//        segmented.selectedSegmentIndex = 0
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 12/255, green: 101/255, blue: 15/255, alpha: 100)], for: .selected)
        segmented.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        segmented.backgroundColor = UIColor(red: 12/255, green: 101/255, blue: 15/255, alpha: 100)
        segmented.addTarget(self, action: #selector(coinSelect), for: .valueChanged)
        return segmented
    }()

    lazy var toLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Para:"
        label.textColor = UIColor(red: 12/255, green: 101/255, blue: 15/255, alpha: 100)
        return label
    }()
    
    lazy var coinSegmented2: UISegmentedControl = {
        let segmented = UISegmentedControl(items: item2)
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 12/255, green: 101/255, blue: 15/255, alpha: 100)], for: .selected)
        segmented.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        segmented.backgroundColor = UIColor(red: 12/255, green: 101/255, blue: 15/255, alpha: 100)
        segmented.addTarget(self, action: #selector(coinSelect2), for: .valueChanged)
        return segmented
    }()
    
    lazy var convertButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Converter", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
        button.setTitleColor(UIColor(red: 12/255, green: 101/255, blue: 15/255, alpha: 100), for: .normal)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(tappedConvertButton), for: .touchUpInside)
        return button
    }()
    
    private func sameCoinAlert(){
        
        let alertController: UIAlertController = UIAlertController(title: "Atenção!", message: "Selecione moedas diferentes", preferredStyle: .alert)
        let alertButton = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(alertButton)
        self.window?.rootViewController!.present(alertController, animated: true)
    }
    
    func withoutValue() {
        
        let alertController: UIAlertController = UIAlertController(title: "Atenção!", message: "Digite um valor", preferredStyle: .alert)
        let alertButton = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(alertButton)
        self.window?.rootViewController!.present(alertController, animated: true)
    }
    
    @objc func tappedConvertButton() {

        self.delegate?.actionConvertButton()
        
    }
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = UIColor(red: 12/255, green: 101/255, blue: 15/255, alpha: 100)
        label.backgroundColor = .white
        label.clipsToBounds = true
        label.layer.cornerRadius = 7
        return label
    }()
    
    func configAddSubview(){
        addSubview(backImage)
        addSubview(convertButton)
        addSubview(valueLabel)
        addSubview(valueTextField)
        addSubview(fromLabel)
        addSubview(coinSegmented)
        addSubview(toLabel)
        addSubview(coinSegmented2)
        addSubview(resultLabel)
    }
    
    @objc func coinSelect(){
        
    }
    
    @objc func coinSelect2() {
        
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            backImage.topAnchor.constraint(equalTo: topAnchor),
            backImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            valueLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            valueTextField.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 10),
            valueTextField.leadingAnchor.constraint(equalTo: valueLabel.leadingAnchor),
            valueTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            fromLabel.topAnchor.constraint(equalTo: valueTextField.bottomAnchor, constant: 35),
            fromLabel.leadingAnchor.constraint(equalTo: valueTextField.leadingAnchor),
            
            coinSegmented.topAnchor.constraint(equalTo: fromLabel.bottomAnchor, constant: 10),
            coinSegmented.leadingAnchor.constraint(equalTo: fromLabel.leadingAnchor),
            coinSegmented.trailingAnchor.constraint(equalTo: valueTextField.trailingAnchor),
            coinSegmented.heightAnchor.constraint(equalToConstant: 30),
            
            toLabel.topAnchor.constraint(equalTo: coinSegmented.bottomAnchor, constant: 35),
            toLabel.leadingAnchor.constraint(equalTo: valueTextField.leadingAnchor),
            
            coinSegmented2.topAnchor.constraint(equalTo: toLabel.bottomAnchor, constant: 10),
            coinSegmented2.leadingAnchor.constraint(equalTo: fromLabel.leadingAnchor),
            coinSegmented2.trailingAnchor.constraint(equalTo: valueTextField.trailingAnchor),
            coinSegmented2.heightAnchor.constraint(equalToConstant: 30),
            
            convertButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            convertButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -300),
            convertButton.heightAnchor.constraint(equalToConstant: 40),
            convertButton.widthAnchor.constraint(equalToConstant: 100),
            
            resultLabel.topAnchor.constraint(equalTo: convertButton.bottomAnchor, constant: 50),
            resultLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            resultLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}
