//
//  StartViewController.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 17.06.2021.
//

import UIKit
import RxSwift

extension Double {
    static let animationDelay: Double = 0.4
    static let hideAnimationDelay: Double = 0.7
    
}

extension CGFloat {
    static let yOffset: CGFloat = 150.0
    static let springWithDamping: CGFloat = 0.6
    static let springVelocity: CGFloat = 5.0
}

class StartViewController: MVVMViewController {
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.startTimer()
    }
    
    private func showPopUp() {
        UIView.animate(withDuration: .animationDelay, delay: 0, usingSpringWithDamping: .springWithDamping, initialSpringVelocity: .springVelocity, options: .curveEaseInOut,  animations: { [weak self] in
            self?.popUpView.transform = CGAffineTransform(translationX: 0, y: .yOffset)
        }) { _ in
            self.hidePopUp()
        }
    }
    
    private func hidePopUp() {
        UIView.animate(withDuration: .animationDelay, delay: .hideAnimationDelay, animations: { [weak self] in
            self?.popUpView.transform = .identity
        })
    }
    
    @objc private func backAction() {
        if let model = viewModel as? BackActionProtocol { model.backPressed() }
    }
}
