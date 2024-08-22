//
//  String + Extension.swift
//  Todolist
//
//  Created by Андрей Сторожко on 08.04.2024.
//

import Foundation
import UIKit

public extension String {
    func height(withConstrainedWidth width: CGFloat, maxHeight: CGFloat = .greatestFiniteMagnitude, font: UIFont) -> CGFloat {
        let constraintRect: CGSize = .init(width: width, height: maxHeight)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect: CGSize = .init(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

        return ceil(boundingBox.width)
    }
    
    func boundingRect(maxWidth: CGFloat = .greatestFiniteMagnitude,
                      maxHeight: CGFloat = .greatestFiniteMagnitude,
                      font: UIFont) -> CGSize {
        let constraintRect: CGSize = .init(width: maxWidth, height: maxHeight)
        let boundingBox: CGRect = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

        return .init(width: ceil(boundingBox.width), height: ceil(boundingBox.height))
    }
}
