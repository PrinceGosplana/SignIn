//
//  LoginSettings.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 17.06.2021.
//

import Foundation
import RxSwift

protocol LoginSettings {
    var emitNetworkState: PublishSubject<NetworkStateMaсhine.State> { get }
    var mainButtonTitle: String { get }
    var subButtonTitle: String { get }
    var timeBasedModel: TimeBasedModel { get }
    func subTapAction()
    func mainTapAction()
    func startTimer()
}

extension LoginSettings {
    func mainTapAction() {}
    func subTapAction() {}
}

protocol BackActionProtocol {
    func backPressed()
}
