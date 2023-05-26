//
//  ViewController.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 23.05.2023.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    // MARK: - UIElements
    
    let mainView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor.white.cgColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    let soglLabel: UILabel = {
        let label = UILabel()
        
        // Создаем атрибутированную строку с текстом и стилями
        let attributedText = NSMutableAttributedString(string: "Я даю согласие на обработку персональных данных и ознакомлен с политикой конфиденциальности")
        
        // Устанавливаем цвет и ссылку для обработки персональных данных
        let personalDataColor = UIColor.primary300
        let personalDataURL = URL(string: "https://www.google.com")!
        attributedText.addAttribute(.foregroundColor, value: personalDataColor, range: NSRange(location: 18, length: 29))
        attributedText.addAttribute(.link, value: personalDataURL, range: NSRange(location: 18, length: 29))
        
        // Устанавливаем цвет и ссылку для политики конфиденциальности
        let privacyPolicyColor = UIColor.primary300
        let privacyPolicyURL = URL(string: "https://www.yandex.com")!
        attributedText.addAttribute(.foregroundColor, value: privacyPolicyColor, range: NSRange(location: 62, length: 29))
        attributedText.addAttribute(.link, value: privacyPolicyURL, range: NSRange(location: 62, length: 29))
        
        // Устанавливаем атрибутированный текст для метки
        label.attributedText = attributedText
        
        // Добавляем возможность открывать ссылки
        label.isUserInteractionEnabled = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.sizeToFit()
        
        return label
    }()
    
    let headImage = UIImageView(image: UIImage(named: "sovkomPeople")!)
    
    let userChoiceControl: UISegmentedControl = {
        let items = ["Я ищу сотрудника", "Я ищу работу"]
        let control = UISegmentedControl(items: items)

        control.layer.borderWidth = 0
        control.layer.masksToBounds = true
        
        let normalTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.system600,
            NSAttributedString.Key.backgroundColor: UIColor.clear
        ]
        let selectedTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.primary300,
            NSAttributedString.Key.backgroundColor: UIColor.clear
        ]
        control.setTitleTextAttributes(normalTitleTextAttributes, for: .normal)
        control.setTitleTextAttributes(selectedTitleTextAttributes, for: .selected)
        
        control.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        control.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        
        // Убираем разделительную черту
        control.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        // Устанавливаем фоновый цвет для выбранного сегмента
        control.selectedSegmentTintColor = .clear
        
        // Устанавливаем высоту сегментов
        control.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        return control
    }()
    
    let phoneNumberTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Номер телефона"
        textField.textColor = UIColor.system600
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.system300b.cgColor
        textField.leftViewMode = .always
        textField.sizeToFit()
        return textField
    }()
    
    let passwordTextField: UITextField = {
        var textField = UITextField()
        textField.isSecureTextEntry = true
        textField.textContentType = .oneTimeCode
        textField.placeholder = "Введите пароль"
        textField.textColor = UIColor.system600
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.system300b.cgColor
        textField.layer.cornerRadius = 8
        textField.leftViewMode = .always
        textField.sizeToFit()
        return textField
    }()
    
    var registerButton: UIButton = {
        var button = UIButton()
        button.setTitle("Зарегестрироваться", for: .normal)
        var attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.primary300,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        var attributeString = NSMutableAttributedString(
            string: "Зарегестрироваться",
            attributes: attributes
        )
        button.setAttributedTitle(attributeString, for: .normal)
        return button
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.backgroundColor = UIColor.primary300.cgColor
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.cornerRadius = 4
        return button
    }()
    
    let checkBoxButton: UIButton = {
        let button = UIButton()
        
        
        // Set the system image for the checkbox
        let selectedImage = UIImage(systemName: "checkmark.square")
        let unselectedImage = UIImage(systemName: "square")
        button.setImage(selectedImage, for: .selected)
        button.setImage(unselectedImage, for: .normal)
        selectedImage?.withTintColor(.primary300)
        
        // Remove the background color for the selected state
        button.setBackgroundImage(UIImage(), for: .selected)
        
        // Set the initial state
        button.isSelected = false
        
        // Add action for button tap
        button.addTarget(self, action: #selector(checkBoxTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc func checkBoxTapped() {
        checkBoxButton.isSelected = !checkBoxButton.isSelected
        // Add your code to handle checkbox state change here
    }


    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeLayoutSubviews()
    }
    
    // MARK: - Functions
    private func setupUI() {
        view.addSubview(mainView)
        view.backgroundColor = .system300
        mainView.addSubview(headImage)
        mainView.addSubview(userChoiceControl)
        mainView.addSubview(phoneNumberTextField)
        mainView.addSubview(passwordTextField)
        mainView.addSubview(soglLabel)
        mainView.addSubview(checkBoxButton)
        mainView.addSubview(registerButton)
        mainView.addSubview(loginButton)
        
    }
    private func makeLayoutSubviews() {
        mainView.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).inset(16)
            make.right.equalTo(view.snp.right).inset(16)
            make.top.equalTo(view.snp.top).offset(110)
            make.height.equalTo(500)
            make.width.equalTo(350)
        }
        headImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        userChoiceControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(headImage.snp.bottom).offset(32)
        }
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(userChoiceControl.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(52)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTextField.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(52)
        }
        checkBoxButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(32)
            make.left.equalTo(mainView.snp.left).inset(24)
            make.width.height.equalTo(24)
        }
        soglLabel.snp.makeConstraints { make in
            make.left.equalTo(checkBoxButton.snp.right).inset(12)
            make.top.equalTo(passwordTextField.snp.bottom).offset(32)
            make.right.equalTo(mainView.snp.right).inset(24)
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(soglLabel.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(46)
        }
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    private func setupBindings() {
        
    }
    
    
}

