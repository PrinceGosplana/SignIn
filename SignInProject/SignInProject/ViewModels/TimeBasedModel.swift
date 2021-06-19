//
//  TimeBasedModel.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 18.06.2021.
//

import Foundation
import RxSwift

class TimeBasedModel {
    
    private var timer: Timer?
    public var timerSubject = PublishSubject<Void>()
    
    init(_ delay: Double = 5.0) {
        timer = Timer.scheduledTimer(withTimeInterval: delay, repeats: true) { [weak self] timer in
            guard let self = self else {
                timer.invalidate()
                return
            }
            self.timerSubject.onNext(())
        }
    }
    
    private func invalidateTimer() {
        timer?.invalidate()
    }
    
    public func timeOut() {
        invalidateTimer()
    }
}
