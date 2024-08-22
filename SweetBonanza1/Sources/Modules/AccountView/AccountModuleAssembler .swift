//
//  AccountModuleAssembler .swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 22.08.2024.
//

import UIKit
import SwiftUI

extension AccountScreen {
    static func buildModule(id: String, name: String, email: String) -> UIHostingController<AccountScreen> {
        let viewModel: AccountViewModel = .init(id: id, name: name, email: email)
        let view: AccountScreen = .init(viewModel: viewModel)
        let viewController: UIHostingController<AccountScreen> = .init(rootView: view)
        viewModel.router = AccountRouter(viewController: viewController)
        
        return viewController
    }
}

protocol AccountRouterInput {
    func logOutButtonClicked()
    func deleteAccoountButtonClicked()
    
}

final class AccountRouter: AccountRouterInput {
    weak var viewController: UIViewController!
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func logOutButtonClicked() {
        viewController.mainTabBarController?.openTab(kind: .main)
        RootViewController.shared.moduleInput.finishMainFlow()
    }
    
    func deleteAccoountButtonClicked() {
        viewController.mainTabBarController?.openTab(kind: .main)
        RootViewController.shared.moduleInput.finishMainFlow()
    }
    
}
