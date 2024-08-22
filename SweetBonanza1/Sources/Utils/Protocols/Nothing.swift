//
//  Nothing.swift
//  Todolist
//
//  Created by Андрей Сторожко on 07.04.2024.
//

import Foundation

public struct Nothing: BaseCellViewModel, BaseHeaderViewModel, BaseFooterViewModel {
    public var id: UUID = .init()
    
    public var size: CGSize {
        return .zero
    }
    
    public var height: CGFloat {
        return size.height
    }
    
    init() { }
}


extension Nothing: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


extension Nothing: Equatable {
    public static func == (lhs: Nothing, rhs: Nothing) -> Bool {
        return lhs.id == rhs.id
    }
}
