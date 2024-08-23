//
//  UIDevice + Extension.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 14.08.2024.
//

import UIKit

extension UIDevice {
    var safeAreaInsets: UIEdgeInsets {
        return UIApplication.shared.windows.first?.safeAreaInsets ?? .zero
    }
}
