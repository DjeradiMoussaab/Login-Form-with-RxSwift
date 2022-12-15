//
//  LoginView.swift
//  Login Form with RxSwift
//
//  Created by Moussaab Djeradi on 15/12/2022.
//

import Foundation
import UIKit

class LoginView : UIView {
    
    let pageTitle: UILabel = {
        let v = UILabel()
        v.font = .systemFont(ofSize: 38, weight: .heavy)
        v.numberOfLines = 2
        v.textAlignment = .left
        v.text = "Login Form with RxSwift"
        v.textAlignment = .center
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let descriptionTitle: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = .systemFont(ofSize: 16, weight: .thin)
        v.numberOfLines = 3
        v.textAlignment = .center
        v.text = "This is a simple Login-Form page made with reactive programming using RxSwift. Validation button will be enabled when entering correct information."
        v.textAlignment = .center
        return v
    }()
    
    let firstName: UITextField = {
        let v = CustomizedTextField()
        v.borderStyle = .roundedRect
        v.placeholder  = "First Name"
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let lastName: UITextField = {
        let v = CustomizedTextField()
        v.placeholder = "Last Name"
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let email: UITextField = {
        let v = CustomizedTextField()
        v.placeholder = "Email Address"
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let password: UITextField = {
        let v = CustomizedTextField()
        v.placeholder = "Password"
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let passwordRetyped: UITextField = {
        let v = CustomizedTextField()
        v.placeholder = "Password Confirmation"
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let button: UIButton = {
        let v = UIButton(type: .system)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .red
        v.setTitleColor(UIColor.white, for: .normal)
        v.setTitle("Login", for: .normal)
        v.layer.cornerRadius = 10
        return v
    }()

    
    let stackView: UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        let stackView = UIStackView(arrangedSubviews: [pageTitle, descriptionTitle, firstName, lastName, email, password, passwordRetyped, button])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 16

        addSubview(stackView)

        NSLayoutConstraint.activate([
            firstName.heightAnchor.constraint(equalToConstant: 60),
            firstName.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            firstName.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            lastName.heightAnchor.constraint(equalToConstant: 60),
            lastName.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            lastName.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            email.heightAnchor.constraint(equalToConstant: 60),
            email.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            email.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            password.heightAnchor.constraint(equalToConstant: 60),
            password.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            password.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            passwordRetyped.heightAnchor.constraint(equalToConstant: 60),
            passwordRetyped.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            passwordRetyped.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            button.heightAnchor.constraint(equalToConstant: 60),
            button.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),

            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        
    }

}
