//
//  SignUpViewModel.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 17.06.2021.
//

import Foundation
import RxSwift

final class SignUpViewModel {
    public let navigationForwardSubject = PublishSubject<Void>()
}

extension SignUpViewModel: LoginSettings {
    var mainButtonTitle: String { "Sign Up" }
    var subButtonTitle: String { "" }

    func mainTapAction() {
        navigationForwardSubject.onNext(())
    }
    
    func subTapAction() { }
}
