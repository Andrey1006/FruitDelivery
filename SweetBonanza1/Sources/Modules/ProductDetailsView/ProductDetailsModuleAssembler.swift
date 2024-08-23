//
//  ProductDetailsModuleAssembler.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 22.08.2024.
//

import UIKit
import SwiftUI

extension ProductDetailsScreen {
    static func buildModule(product: ProductDetailsViewModel) -> UIHostingController<ProductDetailsScreen> {
        let viewModel: ProductDetailsViewModel = .init(id: product.id, title: product.title, image: product.image, price: product.price, isFavorite: product.isFavorite, description: product.description)
        let view: ProductDetailsScreen = .init(viewModel: viewModel)
        let viewController: UIHostingController<ProductDetailsScreen> = .init(rootView: view)
        viewModel.router = ProductDetailsRouter(viewController: viewController)
        
        return viewController
    }
}

protocol ProductDetailsRouterInput {
    func okButtonClicked()
}

final class ProductDetailsRouter: ProductDetailsRouterInput {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func okButtonClicked() {
        viewController?.dismiss(animated: true)
        viewController?.mainTabBarController?.openTab(kind: .main)
    }
}
