//
//  UIViewController + Extension.swift
//  Todolist
//
//  Created by Андрей Сторожко on 07.04.2024.
//

import UIKit

// MARK: - UIViewController
extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantiate<T: UIViewController>(from kind: UIStoryboard.Kind) -> T {
        let storyboard: UIStoryboard = .instantiate(kind: kind)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: T.identifier) as? T else {
            fatalError("Failed to instantiate view controller: \(T.identifier), in storyboard: \(kind.rawValue)")
        }
        
        return viewController
    }
}

//extension UIViewController {
//    func add(child viewController: UIViewController, container: UIView) {
//        addChild(viewController)
//        container.addSubview(viewController.view)
//        viewController.view.frame = container.bounds
//        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        viewController.didMove(toParent: self)
//    }
//}
