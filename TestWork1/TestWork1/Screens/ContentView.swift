//
//  ContentView.swift
//  TestWork1
//
//  Created by Aynur Nasybullin on 10.05.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var coordinator = Coordinator()
    let rootPage: Page
    
    init(_ rootPage: Page = .empty) {
        self.rootPage = rootPage
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: rootPage)
                .navigationBarBackButtonHidden()
                .navigationDestination(for: Page.self) {
                    coordinator.build(page: $0)
                        .navigationBarBackButtonHidden()
                }
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    ContentView()
}
