//
//  StoryboardBased.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 17.06.2021.
//

import Foundation
import UIKit

protocol ViewModelBased: AnyObject {
    associatedtype ViewModel
    var viewModel: ViewModel? { get set }
}

public protocol StoryboardBased: AnyObject {
    static var storyboard: UIStoryboard { get }
}

public extension StoryboardBased {
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: String(describing: self), bundle: Bundle(for: self))
    }
}

public extension StoryboardBased where Self: UIViewController {
    static func instantiate() -> Self {
        guard let vc = storyboard.instantiateInitialViewController() as? Self else {
            fatalError()
        }
        return vc
    }
}

extension StoryboardBased where Self: UIViewController & ViewModelBased {
    static func instantiate(with viewModel: ViewModel) -> Self {
        let viewController = Self.instantiate()
        viewController.viewModel = viewModel
        return viewController
    }
}
