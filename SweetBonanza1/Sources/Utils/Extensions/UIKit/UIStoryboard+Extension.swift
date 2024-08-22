//
//  UIStoryboard + Extension.swift
//  Todolist
//
//  Created by Андрей Сторожко on 07.04.2024.
//

import UIKit
// MARK: - UIStoryboard
extension UIStoryboard {
    enum Kind: String {
        case main = "Main"
    }
    
    static func instantiate(kind: Kind) -> UIStoryboard {
        return .init(name: kind.rawValue, bundle: nil)
    }
}
