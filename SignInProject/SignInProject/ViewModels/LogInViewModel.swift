//
//  LogInViewModel.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 17.06.2021.
//

import Foundation
import RxSwift

final class LogInViewModel {
    public let confirmedSubject = PublishSubject<Void>()
}

extension LogInViewModel: LoginSettings {
    var mainButtonTitle: String { "Log in" }
    var subButtonTitle: String { "Emit IDs" }

    func mainTapAction() {
        confirmedSubject.onNext(())
    }
    
    func subTapAction() {
        confirmedSubject.onNext(())
    }
}
