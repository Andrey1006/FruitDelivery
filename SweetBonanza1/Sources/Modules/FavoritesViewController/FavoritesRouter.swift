//
//  FavoritesRouter.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 19.08.2024.
//

import Foundation

protocol FavoritesRouterProtocol {
//    func pushToDetailProduct(modulePayload: SetDetailsModulePayload)
}

class FavoritesRouter: FavoritesRouterProtocol {
    private weak var viewController: FavoritesViewController!
    
    init(viewController: FavoritesViewController) {
        self.viewController = viewController
    }
    
//    func pushToDetailSet(modulePayload: SetDetailsModulePayload) {
//        let setDetailsViewController: SetDetailsViewController = .instantiate(modulePayload: modulePayload)
//
//        viewController.navigationController?.pushViewController(setDetailsViewController, animated: true)
//    }
}
