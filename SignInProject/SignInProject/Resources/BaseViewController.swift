//
//  BaseViewController.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 17.06.2021.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    
    public let disposeBag = DisposeBag()
    private var shouldCurrentlyHideStatusBar = false
    private var shouldScreenAutorotate = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        setupBindings()
    }
    
    override var prefersStatusBarHidden: Bool { shouldCurrentlyHideStatusBar }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { [.portrait] }
    override var shouldAutorotate: Bool { shouldScreenAutorotate }
    
    internal func setupUI() {}
    internal func setupBindings() {}
    internal func viewWillDisappear() {}
}
