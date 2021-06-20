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

extension SignUpViewModel: LoginSettings {
    var mainButtonTitle: String { "Sign Up" }
    
    func mainTapAction() {
        navigationForwardSubject.onNext(())
    }
}

extension SignUpViewModel: BackActionProtocol {
    func backPressed() {
        navigationBackSubject.onNext(())
    }
}
