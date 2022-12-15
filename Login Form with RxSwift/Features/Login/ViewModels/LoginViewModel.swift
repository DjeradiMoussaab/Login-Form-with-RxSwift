//
//  LoginViewModel.swift
//  Login Form with RxSwift
//
//  Created by Moussaab Djeradi on 15/12/2022.
//

import Foundation
import RxSwift

final class LoginViewModel {
     
    let firstName = PublishSubject<String>()
    let lastName = PublishSubject<String>()
    let email = PublishSubject<String>()
    let password = PublishSubject<String>()
    let passwordRetyped = PublishSubject<String>()
    let message = PublishSubject<String>()
    
    private var isNameValid: Observable<Bool> {
        return Observable.combineLatest(firstName, lastName)
            .map {
                return !$0.0.isEmpty && !$0.1.isEmpty
            }
    }
    
    private var isEmailValid: Observable<Bool> {
        return email
            .map {
                return !$0.isEmpty
                && Helpers.isEmailValid($0)
            }
    }
    
    private var isPasswordValid: Observable<Bool> {
        return Observable.combineLatest(password, passwordRetyped)
            .map {
                return !$0.0.isEmpty
                    && !$0.1.isEmpty
                    && $0.0 == $0.1
                    && Helpers.isPasswordValid($0.0)
            }
    }
    
    func isValid() -> Observable<Bool> {
        return Observable.combineLatest(isEmailValid, isNameValid, isPasswordValid)
            .map {
                return $0.0 && $0.1 && $0.2
            }
            .startWith(false)
    }
    
}


class Helpers {
    
    static func isEmailValid(_ emailStr: String) -> Bool {
        return emailStr.contains("@")
    }
    
    static func isPasswordValid(_ password: String) -> Bool {
        return password.count > 4
    }
}
