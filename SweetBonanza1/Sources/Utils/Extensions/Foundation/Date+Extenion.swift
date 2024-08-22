//
//  Date+Extenion.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 22.08.2024.
//

import Foundation

extension Date {
    func toString(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
