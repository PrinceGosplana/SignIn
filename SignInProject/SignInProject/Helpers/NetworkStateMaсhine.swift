//
//  NetworkStateMaсhine.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 17.06.2021.
//

import RxSwift

final class NetworkStateMaсhine {
    
    public var state: State = .connecting
    public var stateChangedSubject = PublishSubject<State>()
    
    enum State: String {
        case connectionError = "Connection error"
        case connecting = "Connecting"
        case connectionEstablished = "Connection established"
    }
    
    public func transitionToNextState() {
        switch state {
        case .connecting:
            state = arc4random_uniform(2) == 0 ? .connectionError : .connectionEstablished
        case .connectionError, .connectionEstablished:
            state = .connecting
        }
        stateChangedSubject.onNext(state)
    }
    
}
