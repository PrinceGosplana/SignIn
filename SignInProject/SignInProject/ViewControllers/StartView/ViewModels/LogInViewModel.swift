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
    public let messageSentSubject = PublishSubject<Void>()
    public var emitNetworkState = PublishSubject<NetworkStateMaсhine.State>()
    public let showIDsSubject = PublishSubject<Void>()
    public var timeBasedModel: TimeBasedModel
    
    private let networkStateMachine: NetworkStateMaсhine
    private let disposeBag = DisposeBag()
    private let arrayOfIDs =  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    private var timerIDs: Timer?
    
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
    
    func subTapAction() {
        checkNetworkStateAndTrySendingMessage()
        
        invalidateIDsTimer()
        performWith(0, array: arrayOfIDs)
    }
    
    func mainTapAction() {
        invalidateIDsTimer()
        navigationForwardSubject.onNext(())
    }
    
    private func performWith(_ index: Int, array: [Int]) {
        if index < array.count {
            timerIDs = Timer.scheduledTimer(withTimeInterval: Double(array[index]), repeats: false) { [weak self] timer in
                print("Prints its ID = \(array[index]) to the console at the end of the execution")
                self?.performWith(index + 1, array: array)
            }
        }
    }
    
    private func checkNetworkStateAndTrySendingMessage() {
        if networkStateMachine.state == .connectionEstablished {
            messageSentSubject.onNext(())
        }
    }
    
    private func invalidateIDsTimer() {
        if timerIDs != nil {
            timerIDs?.invalidate()
            timerIDs = nil
        }
    }
}

extension LogInViewModel: LoginSettings {
    var mainButtonTitle: String { "Log in" }
    var subButtonTitle: String { "Send Commands" }
}
