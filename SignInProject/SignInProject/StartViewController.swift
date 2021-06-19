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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func setupUI() {
        guard let viewModel = viewModel else { return  }
        navigationButton.setTitle(viewModel.mainButtonTitle, for: .normal)
        optionalButton.setTitle(viewModel.subButtonTitle, for: .normal)
        optionalButton.isHidden = viewModel.subButtonTitle.isEmpty
        
        popUpView.networkState = .connecting
    }
    
    override func setupBindings() {
        guard let viewModel = viewModel else { return  }
        
        viewModel.emitNetworkState.subscribe(onNext: { [weak self] state in
            self?.popUpView.networkState = state
        }).disposed(by: disposeBag)
        
    }
    
}
