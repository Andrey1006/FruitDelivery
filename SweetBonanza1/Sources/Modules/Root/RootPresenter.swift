//
//  RootPresenter.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 15.08.2024.
//

import Foundation

protocol RootPresenterProtocol {
    func viewDidLoad()
}

protocol RootModuleInput {
    func finishOnboardingFlow()
    func finishAuthorizationFlow()
    func popToRootCurrentFlow()
}

class RootPresenter: RootPresenterProtocol, RootModuleInput {
    var view: RootViewControllerProtocol
    private let router: RootRouterProtocol
    
    init(view: RootViewControllerProtocol, router: RootRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
        router.showOnboardingScreen()
    }
    
    func finishOnboardingFlow() {
        router.showAuthorizationScreen()
    }
    
    func finishAuthorizationFlow() {
        router.showMainScreen()
    }
    
    func popToRootCurrentFlow() {
        router.popToRootCurrentFlow()
    }
}

