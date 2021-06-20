//
//  StateRendererTest.swift
//  SignInProjectTests
//
//  Created by OLEKSANDR ISAIEV on 20.06.2021.
//

import XCTest
import RxSwift
@testable import SignInProject

class StateRendererTest: XCTestCase {

    func test_StartViewControllerHaveTheSameState() {
        let sut = makeSUT()
        
        let timeBasedModel = TimeBasedModel()
        let viewModel = SignUpViewModel(timeBasedModel: timeBasedModel, networkStateMachine: sut)
        let viewController = StartViewController.instantiate(with: viewModel)
        
        sut.transitionToNextState()
        
        let viewControllerState = viewController.networkState
        let newState = sut.state
        XCTAssertNotEqual(viewControllerState, newState)
    }
    // Helpers
    
    func makeSUT() -> NetworkStateMaсhine {
        return NetworkStateMaсhine()
    }
}
