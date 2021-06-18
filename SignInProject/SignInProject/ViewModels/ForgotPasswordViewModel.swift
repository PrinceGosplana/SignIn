//
//  ForgotPasswordViewModel.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 17.06.2021.
//

import Foundation
import RxSwift

final class ForgotPasswordViewModel {
}

extension ForgotPasswordViewModel: LoginSettings {
    var mainButtonTitle: String { "Forgot Password" }
    var subButtonTitle: String { "" }

    func mainTapAction() { }
    func subTapAction() { }
}
