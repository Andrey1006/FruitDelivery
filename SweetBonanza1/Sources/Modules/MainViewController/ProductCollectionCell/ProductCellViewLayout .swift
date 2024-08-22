//
//  ProductCellViewLayout .swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 15.08.2024.
//

import Foundation
import UIKit

struct ProductCellViewLayout {
    let contentInsets: UIEdgeInsets = .init(top: 8, left: 24, bottom: 16, right: 24)
    let buttonHeight: CGFloat = 40
    let titleFont: UIFont = UIFont.systemFont(ofSize: 12, weight: .regular)
    let buttonTextFont: UIFont = UIFont.systemFont(ofSize: 21, weight: .heavy)
    let spacingBetweetImageAndTitle: CGFloat = 12
}
