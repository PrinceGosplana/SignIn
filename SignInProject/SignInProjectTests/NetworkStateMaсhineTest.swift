//
//  NetworkStateMaсhineTest.swift
//  SignInProjectTests
//
//  Created by OLEKSANDR ISAIEV on 17.06.2021.
//

import Foundation
import XCTest
@testable import SignInProject

final class NetworkStateMaсhineTest: XCTestCase {
    
    func test_FromConnectingToAnotherState() {
        let sut = makeSUT()
        
        let currentState = sut.state
        sut.transitionToNextState()
        
        let newState = sut.state
        XCTAssertNotEqual(currentState, newState)
    }
    
    func test_FromConnectingToconnectingState() {
        let sut = makeSUT()
        
        let connectingState = sut.state
        sut.transitionToNextState()
        
        sut.transitionToNextState()
        let connectingStateTo = sut.state
        
        XCTAssertEqual(connectingState, connectingStateTo)
    }
    
    // Helpers
    
    func makeSUT() -> NetworkStateMaсhine {
        return NetworkStateMaсhine()
    }
}
