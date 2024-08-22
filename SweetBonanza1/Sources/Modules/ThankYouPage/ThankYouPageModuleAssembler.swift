//
//  ThankYouPageModuleAssembler.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 22.08.2024.
//

import UIKit
import SwiftUI

extension ThankYouPageScreen {
    static func buildModule() -> UIHostingController<ThankYouPageScreen> {
        let viewModel: ThankYouPageViewModel = .init(id: "!", image: "plus", title: "THANK YOU FOR ORDERING")
        let view: ThankYouPageScreen = .init(viewModel: viewModel)
        let viewController: UIHostingController<ThankYouPageScreen> = .init(rootView: view)
        viewModel.router = ThankYouPageRouter(viewController: viewController)
        
        return viewController
    }
}

protocol ThankYouPageRouterInput {
    func okButtonClicked()
}

final class ThankYouPageRouter: ThankYouPageRouterInput {
    weak var viewController: UIViewController!
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func okButtonClicked() {
        let mainTabBarController = viewController.mainTabBarController
        viewController?.navigationController?.popToRootViewController(animated: false)
        mainTabBarController?.openTab(kind: .main)
    }
}
