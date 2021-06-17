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
        navigationController.viewControllers = [viewController]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    private func presentSignUpScreen() { }
    private func presentForgotPasswordScreen() { }
}
