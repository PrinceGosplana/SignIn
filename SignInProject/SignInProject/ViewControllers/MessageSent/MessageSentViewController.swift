//
//  MessageSentViewController.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 20.06.2021.
//

import Foundation
import RxSwift
import RxCocoa

private extension CGFloat {
    static let backgroundAlpha: CGFloat = 0.4
    static let cornerRadius: CGFloat = 10.0
    static let fontSize: CGFloat = 16.0
}

class MessageSentViewController: MVVMViewController {
    
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var okButton: UIButton!
    @IBOutlet private weak var containerView: UIView!
    
    var viewModel: MessageSentViewModel?
    private let disposeBag = DisposeBag()
    
    override func setupUI() {
        guard let viewModel = viewModel else { return }
        self.view.backgroundColor = .black.withAlphaComponent(.backgroundAlpha)
        okButton.setTitle(viewModel.buttonTitle, for: .normal)
        okButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: .fontSize)
        okButton.setTitleColor(.white, for: .normal)
        okButton.layer.masksToBounds = true
        okButton.layer.cornerRadius = .cornerRadius
        okButton.backgroundColor = .systemBlue
        
        messageLabel.text = viewModel.message
        messageLabel.textColor = .white
        messageLabel.font = UIFont.systemFont(ofSize: .fontSize)
        
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = .cornerRadius
        containerView.backgroundColor = .clear
    }
    
    override func setupBindings() {
        okButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                self?.viewModel?.dismissMessage()
            }).disposed(by: disposeBag)
        
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(dismissController))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissController() {
        viewModel?.dismissMessage()
    }
}
