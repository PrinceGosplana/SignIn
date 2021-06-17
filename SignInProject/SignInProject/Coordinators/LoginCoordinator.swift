//
//  LoginCoordinator.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 17.06.2021.
//

import RxSwift

class LoginCoordinator: BaseCoordinator<Void> {
  
  private var viewModel: LogInViewModel!
    
  override func start() -> Observable<Void> {
    viewModel = LogInViewModel()
    let viewController = StartViewController.instantiate(with: viewModel)
    
    let rootViewController = UINavigationController(rootViewController: viewController)
    rootViewController.isNavigationBarHidden = true
    
   
//    viewModel.confirmWithSMSubject.subscribe(onNext: { [weak self] _ in
//
//    }).disposed(by: disposeBag)

    return Observable.never() // viewModel.loginSucceeded.take(1)
  }
  
  
 
}
