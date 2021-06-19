//
//  TimeBasedModel.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 18.06.2021.
//

import Foundation
import RxSwift

class TimeBasedModel {
    private var delay: Double
    private var timer: Timer?
    public var timerSubject = PublishSubject<Void>()
    
    init(_ delay: Double = 5.0) {
        self.delay = delay
    }
    
    private func invalidateTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    public func stopTimer() {
        print("Timer stopTimer")
        invalidateTimer()
    }
    
    public func startTimer() {
        print("Timer startTimer")
        timer = Timer.scheduledTimer(withTimeInterval: delay, repeats: true) { [weak self] timer in
            guard let self = self else {
                timer.invalidate()
                return
            }
            self.timerSubject.onNext(())
        }
    }
}
