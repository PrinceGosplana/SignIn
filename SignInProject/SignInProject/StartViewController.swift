//
//  StartViewController.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 17.06.2021.
//

import UIKit
import RxSwift

class StartViewController: BaseViewController, StoryboardBased, ViewModelBased {
    
    typealias ViewModel = LoginSettings
    var viewModel: ViewModel?
    private let disposeBag = DisposeBag()
    
    @IBOutlet private var navigationButton: UIButton!
    @IBOutlet private var optionalButton: UIButton!
    @IBOutlet private var popUpView: PopUpView!
    
    @IBAction func navigationForward() {
        viewModel?.mainTapAction()
    }
    
    @IBAction func showIDsAction() {
        viewModel?.subTapAction()
    }

    override func setupUI() {
        guard let viewModel = viewModel else { return  }
        navigationButton.setTitle(viewModel.mainButtonTitle, for: .normal)
        optionalButton.setTitle(viewModel.subButtonTitle, for: .normal)
        optionalButton.isHidden = viewModel.subButtonTitle.isEmpty
        
        popUpView.alpha = 0.0
        
        if let _ = viewModel as? BackActionProtocol {
            let back = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backAction))
            navigationItem.leftBarButtonItems = [back]
        }
    }
    
    override func setupBindings() {
        guard let viewModel = viewModel else { return  }
        
        viewModel.emitNetworkState.subscribe(onNext: { [weak self] state in
            self?.popUpView.networkState = state
            self?.showPopUp()
        }).disposed(by: disposeBag)

    }
    
    private func showPopUp() {
        let moveTransform = popUpView.transform.translatedBy(x: 0.0, y: 50.0)
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 5, options: .curveEaseInOut,  animations: { [weak self] in
            self?.popUpView.alpha = 1.0
            self?.popUpView.transform = moveTransform
        }) { _ in
            self.hidePopUp()
        }
    }
    
    private func hidePopUp() {
        let moveTransform = popUpView.transform.translatedBy(x: 0.0, y: -50.0)
        UIView.animate(withDuration: 0.4, delay: 0.7, animations: { [weak self] in
            self?.popUpView.transform = moveTransform
        }) { _ in
            self.popUpView.alpha = 0.0
        }
    }
    
    @objc private func backAction() {
        if let model = viewModel as? BackActionProtocol { model.backPressed() }
    }
}
