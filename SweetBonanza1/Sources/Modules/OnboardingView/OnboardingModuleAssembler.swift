//
//  OnboardingModuleAssembler.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 20.08.2024.
//

import UIKit
import SwiftUI

extension OnboardingView {
    static func buildModule() -> UIHostingController<OnboardingView> {
        var viewModel: OnboardingViewModel = .init(title: "DFJKHSJFHKDSJHSDFSJHKFDSJKDSJKSFJHKDHJKDFHJKDFSJKHFDSHKJS")
        let view: OnboardingView = .init(viewModel: viewModel)
        let viewController: UIHostingController<OnboardingView> = .init(rootView: view)
        viewModel.router = OnboardingRouter(viewController: viewController)
        
        return viewController
    }
}

protocol OnboardingRouterInput {
    func startButtonClicked()
}

final class OnboardingRouter: OnboardingRouterInput {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func startButtonClicked() {
        RootViewController.shared.moduleInput.finishOnboardingFlow()
    }
}
