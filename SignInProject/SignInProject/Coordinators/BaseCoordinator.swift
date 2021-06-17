//
//  BaseCoordinator.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 17.06.2021.
//

import Foundation
import RxSwift

class BaseCoordinator<ResultType> {
    
    typealias CoordinationResult = ResultType
    
  
    public let disposeBag = DisposeBag()
    private let identifier = UUID()
    private var childCoordinators = [UUID: Any]()
  
   
    private func store<T>(coordinator: BaseCoordinator<T>) {
      childCoordinators[coordinator.identifier] = coordinator
    }
    
    private func free<T>(coordinator: BaseCoordinator<T>) {
      childCoordinators[coordinator.identifier] = nil
    }
    
    public func coordinate<T>(to coordinator: BaseCoordinator<T>) -> Observable<T> {
        store(coordinator: coordinator)
      
        return coordinator.start()
            .do(onNext: { [weak self, weak coordinator] _ in
              guard let self = self, let coordinator = coordinator else { return }
                self.free(coordinator: coordinator)
            })
    }
    
    public func start() -> Observable<ResultType> {
        fatalError("Start method should be implemented.")
    }
}
