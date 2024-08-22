//
//  BasketModuleAssembler.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 19.08.2024.
//

import UIKit
import SwiftUI

extension BasketView {
    static func buildModule(items: [BasketItemViewContent]) -> UIHostingController<BasketView> {
        let viewModel: BasketViewModel = .init(items: items)
        let view: BasketView = .init(viewModel: viewModel)
        let viewController: UIHostingController<BasketView> = .init(rootView: view)
        viewModel.router = BasketRouter(viewController: viewController)
        
        return viewController
    }
}

protocol BasketRouterInput {
    func continueButtonClicked()
    func selectProductButtonClicked()
}

final class BasketRouter: BasketRouterInput {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func continueButtonClicked() {
//        let productDetails: UIViewController = .init()
        let placingOrderView = UIHostingController(rootView: PlacingOrderView(content: .init(id: "1")))

        viewController?.navigationController?.pushViewController(placingOrderView, animated: true)
    }
    
    func selectProductButtonClicked() {
        viewController?.mainTabBarController?.openTab(kind: .main)
    }
}
