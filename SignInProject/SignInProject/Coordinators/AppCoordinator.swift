//
//  AppCoordinator.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 17.06.2021.
//

import Foundation
import RxSwift

class AppCoordinator: BaseCoordinator<Void> {
    
    private let window: UIWindow
    private let navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
    }
    
    func startApp() {
        self.pushLoginScreen()
    }
    
    private func pushLoginScreen() {
        let timeBasedModel = TimeBasedModel()
        let networkStateMachine = NetworkStateMaсhine()
        let viewModel = LogInViewModel(timeBasedModel: timeBasedModel, networkStateMachine: networkStateMachine)
        let viewController = StartViewController.instantiate(with: viewModel)
        
        viewModel.navigationForwardSubject.subscribe(onNext: { [weak self] _ in
            self?.pushSignUpScreen()
        }).disposed(by: disposeBag)
        
        viewModel.messageSentSubject.subscribe(onNext: { [weak self] _ in
            self?.presentMessageSentScreen()
        }).disposed(by: disposeBag)
        
        navigationController.viewControllers = [viewController]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    private func pushSignUpScreen() {
        let timeBasedModel = TimeBasedModel()
        let networkStateMachine = NetworkStateMaсhine()
        let viewModel = SignUpViewModel(timeBasedModel: timeBasedModel, networkStateMachine: networkStateMachine)
        let viewController = StartViewController.instantiate(with: viewModel)
        
        viewModel.navigationForwardSubject.subscribe(onNext: { [weak self] _ in
            
            self?.pushForgotPasswordScreen()
        }).disposed(by: disposeBag)
        
        viewModel.navigationBackSubject.subscribe(onNext: { [weak self] _ in
            self?.navigationController.popViewController(animated: true)
        }).disposed(by: disposeBag)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func pushForgotPasswordScreen() {
        let timeBasedModel = TimeBasedModel()
        let networkStateMachine = NetworkStateMaсhine()
        let viewModel = ForgotPasswordViewModel(timeBasedModel: timeBasedModel, networkStateMachine: networkStateMachine)
        let viewController = StartViewController.instantiate(with: viewModel)
        
        viewModel.navigationBackSubject.subscribe(onNext: { [weak self] _ in
            self?.navigationController.popViewController(animated: true)
        }).disposed(by: disposeBag)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func presentMessageSentScreen() {
        let viewModel = MessageSentViewModel(message: "Message sent")
        let viewController = MessageSentViewController.instantiate(with: viewModel)
        
        viewModel.dismissSubject.subscribe(onNext: { _ in
            viewController.dismiss(animated: true)
        }).disposed(by: disposeBag)
        
        viewController.modalPresentationStyle = .overCurrentContext // overFullScreen
        navigationController.present(viewController, animated: true)
    }
}
