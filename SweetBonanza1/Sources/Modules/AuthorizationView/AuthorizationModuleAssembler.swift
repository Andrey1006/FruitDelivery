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
        var viewModel: AuthorizationViewModel = .init(name: "123")
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

final class AuthorizationRouter: AuthorizationRouterInput {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func signInButtonClicked() {
        RootViewController.shared.moduleInput.finishAuthorizationFlow()
    }
    
    func haveNotAccountClicked() {
        let productDetails: UIViewController = .init()
        let registrationView = UIHostingController(rootView: RegistrationView(content: .init(id: "1")))

        viewController?.navigationController?.pushViewController(registrationView, animated: true)
    }
}
