//
//  ViewController.swift
//  ReposFest
//
//  Created by Paulo Andres Gonzales De Oliveira on 14/05/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.logo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "ReParty!"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let sublabel = UILabel()
        sublabel.text = "Bem vindo na festa dos repositórios"
        sublabel.textColor = .black
        sublabel.font = .systemFont(ofSize: 15, weight: .regular)
        sublabel.numberOfLines = 0
        sublabel.textAlignment = .center
        sublabel.translatesAutoresizingMaskIntoConstraints = false
        return sublabel
    }()
    
    private lazy var userInput: UITextField = {
        userInput = UITextField.init();
        userInput.placeholder = "Placeholder"
        userInput.textColor = .black
        userInput.backgroundColor = .white
        userInput.layer.cornerRadius = 13
        userInput.layer.borderWidth = 1.5
        userInput.layer.borderColor = UIColor.black.cgColor
        userInput.textAlignment = .natural
        userInput.addTarget(self, action: #selector(inputTexting), for: .editingChanged)
        return userInput
    }()
    
    @objc private func inputTexting() {
        if userInput.text?.isEmpty == true {
            searchButton.isEnabled = false
        } else {
            searchButton.isEnabled = true
        }
    }
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Buscar", for: .normal)
        button.backgroundColor = .buttonSearch
        button.setTitleColor(.background, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    @objc private func buttonPressed() {
        navigationController?.pushViewController(FoundViewController(), animated: true)
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [label, logoImageView, welcomeLabel, UIView(), stackViewTwo, searchButton])
        stackView.backgroundColor = .background
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var userLabel: UILabel = {
        let userLabel = UILabel()
        userLabel.text = "User"
        userLabel.textColor = .black
        userLabel.font = .systemFont(ofSize: 15, weight: .bold)
        userLabel.numberOfLines = 0
        userLabel.textAlignment = .left
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        return userLabel
    }()
    
    private lazy var stackViewTwo: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userLabel, userInput])
        stackView.backgroundColor = .background
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 25
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        // Do any additional setup after loading the view.
        addSubView()
        setupConstraints()
    }
    
    private func addSubView() {
        view.addSubview(stackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            userInput.heightAnchor.constraint(equalToConstant: 50),
            userInput.widthAnchor.constraint(equalToConstant: 300),
            
            searchButton.heightAnchor.constraint(equalToConstant: 45),
            searchButton.widthAnchor.constraint(equalToConstant: 400)
            
        ])
    }
}


