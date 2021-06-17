//
//  LoginSettings.swift
//  SignInProject
//
//  Created by OLEKSANDR ISAIEV on 17.06.2021.
//

import Foundation

protocol LoginSettings {
    var mainButtonTitle: String { get }
    var subButtonTitle: String { get }
    func mainTapAction()
    func subTapAction()
}
