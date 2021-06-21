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
    public var timerSubject = PublishSubject<Int>()
    
    init(_ delay: Double = 5.0) {
        self.delay = delay
    }
    
    public func stopTimer() {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
    
    public func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: delay, repeats: true) { [weak self] timer in
            guard let self = self else {
                timer.invalidate()
                return
            }
            self.timerSubject.onNext((Int(self.delay)))
        }
    }
}
