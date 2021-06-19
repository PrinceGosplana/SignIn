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
    func mainTapAction()
    func subTapAction()
    func startTimer()
}

protocol BackActionProtocol {
    func backPressed()
}
