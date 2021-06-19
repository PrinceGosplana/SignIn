//
//  ForgotPasswordViewModel.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 17.06.2021.
//

import Foundation
import RxSwift

final class ForgotPasswordViewModel {
    public var emitNetworkState = PublishSubject<NetworkStateMaсhine.State>()
    public let navigationBackSubject = PublishSubject<Void>()
    var timeBasedModel = TimeBasedModel()
}

extension ForgotPasswordViewModel: LoginSettings {
    var mainButtonTitle: String { "Forgot Password" }
    var subButtonTitle: String { "" }
    
    func mainTapAction() { }
    func subTapAction() { }
}

extension ForgotPasswordViewModel: BackActionProtocol {
    func backPressed() {
        navigationBackSubject.onNext(())
    }
}
