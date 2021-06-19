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
    
    public var timeBasedModel: TimeBasedModel
    private let networkStateMachine: NetworkStateMaсhine
    private let disposeBag = DisposeBag()
    
    init(timeBasedModel: TimeBasedModel, networkStateMachine: NetworkStateMaсhine) {
        self.timeBasedModel = timeBasedModel
        self.networkStateMachine = networkStateMachine
        
        self.timeBasedModel.timerSubject.subscribe(onNext: { [weak self] _ in
            self?.networkStateMachine.transitionToNextState()
        }).disposed(by: disposeBag)
        
        self.networkStateMachine.stateChangedSubject.subscribe(onNext: { [weak self] state in
            self?.emitNetworkState.onNext(state)
        }).disposed(by: disposeBag)
    }
    
    func startTimer() {
        timeBasedModel.startTimer()
    }
}

extension ForgotPasswordViewModel: LoginSettings {
    var mainButtonTitle: String { "Forgot Password" }
    var subButtonTitle: String { "" }
}

extension ForgotPasswordViewModel: BackActionProtocol {
    func backPressed() {
        navigationBackSubject.onNext(())
    }
}
