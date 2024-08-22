//
//  MainRouter .swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 15.08.2024.
//

import Foundation
import UIKit
import SwiftUI

protocol MainRouterProtocol {
//    func pushToDetailProduct(modulePayload: SetDetailsModulePayload)
    func pushToBasket()
    func pushToMain()
}

class MainRouter: MainRouterProtocol {
    private weak var viewController: MainViewController!
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
    
    func pushToBasket() {
        viewController.mainTabBarController?.openTab(kind: .basket)
    }
    
    func pushToMain() {
//        viewController.mainTabBarController?.openTab(kind: .main)
    }
}
