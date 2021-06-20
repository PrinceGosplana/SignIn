//
//  MessageSentViewModel.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 20.06.2021.
//

import Foundation
import RxSwift

final class MessageSentViewModel {
    public let dismissSubject = PublishSubject<Void>()
    public let message: String
    public let buttonTitle: String
    
    private let disposeBag = DisposeBag()
    
    init(message: String) {
        self.message = message
        self.buttonTitle = "Ok"
    }
    
    func dismissMessage() {
        dismissSubject.onNext(())
    }
}
