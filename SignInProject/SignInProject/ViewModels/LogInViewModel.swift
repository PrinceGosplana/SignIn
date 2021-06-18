//
//  LogInViewModel.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 17.06.2021.
//

import Foundation
import RxSwift

final class LogInViewModel {
    public let navigationForwardSubject = PublishSubject<Void>()
    public let showIDsSubject = PublishSubject<Void>()
}

extension LogInViewModel: LoginSettings {
    var mainButtonTitle: String { "Log in" }
    var subButtonTitle: String { "Emit IDs" }

    func mainTapAction() {
        navigationForwardSubject.onNext(())
    }
    
    func subTapAction() {
        showIDsSubject.onNext(())
    }
}
