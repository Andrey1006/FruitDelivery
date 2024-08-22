//
//  Date + Extension.swift
//  Todolist
//
//  Created by Андрей Сторожко on 07.04.2024.
//

import Foundation

extension Date {
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self) ?? .init()
    }

    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self) ?? .init()
    }

    func formatted(format: String) -> String {
        return DateFormatter.with(format: format).string(from: self)
    }
}

extension DateFormatter {
    static func with(format: String) -> DateFormatter {
        let formatter: DateFormatter = .init()
        formatter.dateFormat = format
        
        return formatter
    }
}

