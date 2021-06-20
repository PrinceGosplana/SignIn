//
//  MessageSentViewController.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 20.06.2021.
//

import Foundation
import RxSwift
import RxCocoa

class MessageSentViewController: BaseViewController, StoryboardBased, ViewModelBased {
    
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var okButton: UIButton!
    
    var viewModel: MessageSentViewModel?
    private let disposeBag = DisposeBag()
    
    override func setupUI() {
        guard let viewModel = viewModel else { return }
        okButton.setTitle(viewModel.buttonTitle, for: .normal)
        messageLabel.text = viewModel.message
    }
    
    override func setupBindings() {
        okButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                self?.viewModel?.dismissMessage()
            }).disposed(by: disposeBag)
    }
}
