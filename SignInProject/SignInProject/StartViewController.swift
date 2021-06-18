//
//  StartViewController.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 17.06.2021.
//

import UIKit

class StartViewController: BaseViewController, StoryboardBased, ViewModelBased {
    
    typealias ViewModel = LoginSettings
    var viewModel: ViewModel?
    
    @IBOutlet private var navigationButton: UIButton!
    @IBOutlet private var optionalButton: UIButton!
    
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
    }
    
//    override func setupBindings() {
//        guard let viewModel = viewModel else { return  }
//        navigationButton
//    }
    
}
