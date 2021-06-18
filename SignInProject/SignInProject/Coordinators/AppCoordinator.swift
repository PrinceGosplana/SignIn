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
        self.presentLoginScreen()
    }
    
    private func presentLoginScreen() {
        let viewModel = LogInViewModel()
        let viewController = StartViewController.instantiate(with: viewModel)
        
        viewModel.navigationForwardSubject.subscribe(onNext: { [weak self] _ in
            self?.presentSignUpScreen()
        }).disposed(by: disposeBag)
        
        navigationController.viewControllers = [viewController]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    private func presentSignUpScreen() {
        let viewModel = SignUpViewModel()
        let viewController = StartViewController.instantiate(with: viewModel)
        
        viewModel.navigationForwardSubject.subscribe(onNext: { [weak self] _ in
            self?.presentForgotPasswordScreen()
        }).disposed(by: disposeBag)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func presentForgotPasswordScreen() {
        let viewModel = ForgotPasswordViewModel()
        let viewController = StartViewController.instantiate(with: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
