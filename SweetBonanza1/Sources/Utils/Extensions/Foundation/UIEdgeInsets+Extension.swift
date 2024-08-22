//
//  UIEdgeInsets + Extension.swift
//  Todolist
//
//  Created by Андрей Сторожко on 07.04.2024.
//

import UIKit

extension UIEdgeInsets {
    var horizontal: CGFloat {
        return left + right
    }
    
    var vertical: CGFloat {
        return top + bottom
    }
}
