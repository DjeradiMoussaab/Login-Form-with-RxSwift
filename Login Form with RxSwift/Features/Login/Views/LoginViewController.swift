//
//  ViewController.swift
//  Login Form with RxSwift
//
//  Created by Moussaab Djeradi on 15/12/2022.
//

import UIKit
import RxSwift

class LoginViewController: UIViewController {
    
    private var loginView : LoginView!
    private var loginViewModel : LoginViewModel!
    
    private var disposeBag = DisposeBag()

    
    override func loadView() {
        super.loadView()
        loginViewModel = LoginViewModel()
        setupViews()

    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        loginView = LoginView()
        view.addSubview(loginView)
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    private func setupBindings() {
        
        loginView.firstName.rx.text
            .map { $0 ?? "" }
            .bind(to: loginViewModel.firstName)
            .disposed(by: disposeBag)
        
        loginView.lastName.rx.text
            .map { $0 ?? "" }
            .bind(to: loginViewModel.lastName)
            .disposed(by: disposeBag)
        
        loginView.email.rx.text
            .map { $0 ?? "" }
            .bind(to: loginViewModel.email)
            .disposed(by: disposeBag)
        
        loginView.password.rx.text
            .map { $0 ?? "" }
            .bind(to: loginViewModel.password)
            .disposed(by: disposeBag)
        
        loginView.passwordRetyped.rx.text
            .map { $0 ?? "" }
            .bind(to: loginViewModel.passwordRetyped)
            .disposed(by: disposeBag)
        
        loginViewModel.isValid()
            .bind(to: loginView.button.rx.isEnabled)
            .disposed(by: disposeBag)
        
        loginViewModel.isValid()
            .map { $0 ? 1 : 0.2 }
            .bind(to: loginView.button.rx.alpha)
            .disposed(by: disposeBag)
        
    }


}

