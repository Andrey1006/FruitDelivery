//
//  Collection + Extension.swift
//  Todolist
//
//  Created by Андрей Сторожко on 07.04.2024.
//

import Foundation

extension Collection {
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    func withoutNils<T>() -> [T] where Element == Optional<T> {
        return compactMap { $0 }
    }
}
