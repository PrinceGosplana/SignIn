//
//  NetworkStateMaсhineTest.swift
//  SignInProjectTests
//
//  Created by OLEKSANDR ISAIEV on 17.06.2021.
//

import Foundation
import XCTest
import RxSwift
@testable import SignInProject

final class NetworkStateMaсhineTest: XCTestCase {
    
    private let disposeBag = DisposeBag()
    
    func test_FromEmptyToAnotherState() {
        let sut = makeSUT()
        
        let currentState = sut.state
        sut.transition()
        
        let newState = sut.state
        XCTAssertNotEqual(currentState, newState)
    }
    
    // Helpers
    
    func makeSUT() -> NetworkStateMaсhine {
        return NetworkStateMaсhine()
    }
}
