//
//  UIDevice + Extension.swift
//  AmericanFootballTraining
//
//  Created by Андрей Сторожко on 04.06.2024.
//

import UIKit

extension UIDevice {
    var safeAreaInsets: UIEdgeInsets {
        return UIApplication.shared.windows.first?.safeAreaInsets ?? .zero
    }
}
