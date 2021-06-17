//
//  ForgotPasswordViewModel.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 17.06.2021.
//

import Foundation
import RxSwift

final class ForgotPasswordViewModel {
    public let confirmedSubject = PublishSubject<Void>()
}

extension ForgotPasswordViewModel: LoginSettings {
    var mainButtonTitle: String { "Forgot Password" }
    var subButtonTitle: String { "" }

    func mainTapAction() {
        confirmedSubject.onNext(())
    }
    
    func subTapAction() {
        confirmedSubject.onNext(())
    }
}
