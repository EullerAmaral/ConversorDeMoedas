//
//  TelaInicialScreen.swift
//  ConversorDeMoedas
//
//  Created by Iphone on 30/04/23.
//

import UIKit

protocol TelaInicialScreenProtocol: AnyObject{
    func actionStartButton()
}

class TelaInicialScreen: UIView {

    weak var delegate: TelaInicialScreenProtocol?
    func delegate(delegate:TelaInicialScreenProtocol?){
        self.delegate = delegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backImage)
        addSubview(simbolImage)
        addSubview(startButton)
        addSubview(titleLabel)
        configConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var backImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Home")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Conversor de moedas"
        label.font = UIFont.systemFont(ofSize: 30, weight: .light)
        label.textColor = UIColor(red: 12/255, green: 101/255, blue: 15/255, alpha: 100)
        return label
    }()
    
    lazy var simbolImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Money")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Começar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
        button.setTitleColor(UIColor(red: 12/255, green: 101/255, blue: 15/255, alpha: 100), for: .normal)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(addTargetStartButton), for: .touchUpInside)
        return button
    }()
    
        @objc func addTargetStartButton(){
        print("StartButton OK")
            self.delegate?.actionStartButton()
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            backImage.topAnchor.constraint(equalTo: topAnchor),
            backImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        
            simbolImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            simbolImage.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -220),
            startButton.heightAnchor.constraint(equalToConstant: 40),
            startButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
