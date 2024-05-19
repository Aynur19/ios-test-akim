//
//  Coordinator.swift
//  TestWork1
//
//  Created by Aynur Nasybullin on 19.05.2024.
//

import SwiftUI

enum Page {
    case empty, first, second
}

final class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    init() {
        push(.first)
        push(.second)
    }

    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func reset(_ isReset: Bool) {
        if isReset { popToRoot() }
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
            case .empty: EmptyView()
            case .first: FirstView()
            case .second: SecondView()
        }
    }
}
