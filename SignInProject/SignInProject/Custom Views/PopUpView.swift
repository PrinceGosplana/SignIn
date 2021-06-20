//
//  PopUpView.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 18.06.2021.
//

import UIKit

private extension CGFloat {
    static let cornerRadius: CGFloat = 10.0
    static let textSize: CGFloat = 16.0
    static let mainAlpha: CGFloat = 0.8
}

final class PopUpView: UIView {
    
    private var networkState: NetworkStateMaсhine.State?
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var backView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customInit()
    }
        
    public func updateWithState(_ state: NetworkStateMaсhine.State) {
        networkState = state
        updateState()
    }
//    var networkState: NetworkStateMaсhine.State = .connecting {
//        didSet {
//            updateState()
//        }
//    }
    
    // MARK: - Private functions
    
    private func customInit() {
        Bundle.main.loadNibNamed("PopUpView", owner: self, options: nil)
        contentView.fixInView(self)
        backgroundColor = .clear
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: .textSize)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = .cornerRadius
        backView.alpha = .mainAlpha
    }
    
    private func updateState() {
        switch networkState {
        case .connecting:
            backView.backgroundColor = .systemYellow
        case .connectionError:
            backView.backgroundColor = .systemRed
        case .connectionEstablished:
            backView.backgroundColor = .systemGreen
        case .none:
            backView.backgroundColor = .clear
        }
        titleLabel.text = networkState?.rawValue ?? ""
    }
}
