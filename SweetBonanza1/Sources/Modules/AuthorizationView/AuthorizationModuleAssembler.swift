//
//  AuthorizationModuleAssembler.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 20.08.2024.
//

import UIKit
import SwiftUI

extension AuthorizationView {
    static func buildModule() -> UIHostingController<AuthorizationView> {
        var viewModel: AuthorizationViewModel = .init()
        let view: AuthorizationView = .init(viewModel: viewModel)
        let viewController: UIHostingController<AuthorizationView> = .init(rootView: view)
        viewModel.router = AuthorizationRouter(viewController: viewController)
        
        return viewController
    }
}

protocol AuthorizationRouterInput {
    func signInButtonClicked()
    func haveNotAccountClicked()
}

@MainActor
final class AuthorizationRouter: AuthorizationRouterInput {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func signInButtonClicked() {
        RootViewController.shared.moduleInput.finishAuthorizationFlow()
    }
    
    func haveNotAccountClicked() {
        let rootViewController: UIHostingController<RegistrationScreen> = RegistrationScreen.buildModule()
//        let navigationController: UINavigationController = .init(rootViewController: rootViewController)
        
//        let registrationView = UIHostingController(rootView: rootViewController.view)

        viewController?.navigationController?.pushViewController(rootViewController, animated: true)
    }
}
