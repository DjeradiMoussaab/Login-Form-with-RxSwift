//
//  CustomUITextField.swift
//  Login Form with RxSwift
//
//  Created by Moussaab Djeradi on 15/12/2022.
//

import UIKit
import RxSwift
import RxCocoa

final class CustomizedTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        borderStyle = .roundedRect
        textAlignment = .center
    }
}
