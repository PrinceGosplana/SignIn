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
    public let navigationBackSubject = PublishSubject<Void>()
    public var emitNetworkState = PublishSubject<NetworkStateMaсhine.State>()
    var timeBasedModel = TimeBasedModel()
}

extension SignUpViewModel: LoginSettings {
    var mainButtonTitle: String { "Sign Up" }
    var subButtonTitle: String { "" }
    
    func mainTapAction() {
        navigationForwardSubject.onNext(())
    }
    
    func subTapAction() { }
}

extension SignUpViewModel: BackActionProtocol {
    func backPressed() {
        navigationBackSubject.onNext(())
    }
}
