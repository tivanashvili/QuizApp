//
//  ViewController.swift
//  QuizApp
//
//  Created by tornike ivanashvili on 23.06.23.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Components
    private let blueImageView: UIImageView = {
        let blueImageView = UIImageView()
        blueImageView.image = Constants.BlueImageView.image
        blueImageView.contentMode = .scaleAspectFill
        blueImageView.translatesAutoresizingMaskIntoConstraints = false
        return blueImageView
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = Constants.TitleLabel.text
        titleLabel.backgroundColor = Constants.TitleLabel.backgroundColor
        titleLabel.font = Constants.TitleLabel.font
        titleLabel.textColor = Constants.TitleLabel.textColor
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private let icon: UIImageView = {
        let icon = UIImageView()
        icon.image = Constants.Icon.image
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private let loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.backgroundColor = Constants.LoginTextField.backgroundColor
        loginTextField.font =  Constants.LoginTextField.font
        loginTextField.textColor = Constants.LoginTextField.textColor
        loginTextField.layer.borderColor = Constants.LoginTextField.borderColor
        loginTextField.layer.borderWidth = Constants.LoginTextField.borderWidth
        loginTextField.textAlignment = .center
        loginTextField.layer.cornerRadius = Constants.LoginTextField.cornerRadius
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.placeholder = Constants.LoginTextField.placeHolder
        return loginTextField
    }()
    
    private lazy var startButton: UIButton = {
        let startButton = UIButton(type: .custom)
        startButton.layer.cornerRadius = Constants.StartButton.cornerRadius
        startButton.setImage(Constants.StartButton.image, for: .normal)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        return startButton
    }()
    
    private var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addTapGestureRecognizer()
        observeKeyboardNotifications()
    }
    
    private func setupViews() {
        setupBlueImageViewConstraints()
        setupTitleLabelConstraints()
        setupIconConstraints()
        setupLoginTextFieldConstraints()
        setupStartButton()
    }
    
    private func setupBlueImageViewConstraints() {
        view.addSubview(blueImageView)
        NSLayoutConstraint.activate([
            blueImageView.topAnchor.constraint(equalTo: view.topAnchor),
            blueImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blueImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blueImageView.heightAnchor.constraint(equalToConstant: Constants.BlueImageView.heightAnchor)
        ])
    }
    
    private func setupTitleLabelConstraints() {
        blueImageView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.TitleLabel.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.TitleLabel.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.TitleLabel.topAnchor)
        ])
    }
    
    private func setupIconConstraints() {
        blueImageView.addSubview(icon)
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.Icon.topAnchor),
            icon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Icon.leadingAnchor),
            icon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.Icon.trailingAnchor)
        ])
    }
    
    private func setupLoginTextFieldConstraints() {
        view.addSubview(loginTextField)
        bottomConstraint = loginTextField.topAnchor.constraint(equalTo: blueImageView.bottomAnchor, constant: Constants.LoginTextField.topAnchor)
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: blueImageView.bottomAnchor, constant: Constants.LoginTextField.topAnchor),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.LoginTextField.trailingAnchor),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.LoginTextField.leadingAnchor),
            loginTextField.heightAnchor.constraint(equalToConstant: Constants.LoginTextField.heightAnchor),
            bottomConstraint
        ])
    }
    
    private func setupStartButton() {
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: Constants.StartButton.topAnchor),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func addTapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    private func observeKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        
        let keyboardHeight = keyboardFrame.size.height / 16
        
        bottomConstraint.constant = -keyboardHeight - Constants.StartButton.topAnchor
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        bottomConstraint.constant = Constants.LoginTextField.topAnchor
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - Constants
private extension LoginViewController {
    enum Constants {
        enum BlueImageView {
            static let image = UIImage(named: "coverImage")
            static let heightAnchor: CGFloat = 433
        }
        
        enum LoginTextField {
            static let contentInset: UIEdgeInsets = UIEdgeInsets(top: 5, left: 1.0, bottom: 5, right: 1.0)
            static let backgroundColor: UIColor = .clear
            static let font: UIFont = .systemFont(ofSize: 14)
            static let placeHolder = "შეიყვანე სახელი"
            static let textColor = UIColor(hex: "C7C7C7")
            static let borderColor = UIColor(hex: "FFC44A").cgColor
            static let borderWidth: CGFloat = 1.0
            static let cornerRadius: CGFloat = 12
            static let topAnchor: CGFloat = 92
            static let leadingAnchor: CGFloat = 54
            static let trailingAnchor: CGFloat = -54
            static let heightAnchor: CGFloat = 44
        }
        
        enum StartButton {
            static let cornerRadius: CGFloat = 12
            static let image = UIImage(named: "StartButton")
            static let topAnchor: CGFloat = 26
        }
        
        enum TitleLabel {
            static let backgroundColor: UIColor = .clear
            static let textColor: UIColor = .white
            static let text = "ჩემი პირველი ქვიზი"
            static let font: UIFont =  .systemFont(ofSize: 20)
            static let leadingAnchor: CGFloat = 88
            static let trailingAnchor: CGFloat = -89
            static let topAnchor: CGFloat = 121
        }
        
        enum Icon {
            static let image = UIImage(named: "Illustration")
            static let topAnchor: CGFloat = 34
            static let leadingAnchor: CGFloat = 73
            static let trailingAnchor: CGFloat = -73
        }
    }
}
