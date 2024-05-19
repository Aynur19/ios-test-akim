//
//  ContentView.swift
//  TestWork2
//
//  Created by Aynur Nasybullin on 19.05.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.model.media, id: \.self) { item in
                    VStack {
                        AsyncImage(url: .init(string: item.imageUrl)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 160, height: 160)
                        
                        videoLink(item.videoUrl)
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.indigo, lineWidth: 2)
                    }
                }
            }
            .padding()
            .onAppear {
                viewModel.updateData()
            }
        }
    }
    
    
    @ViewBuilder
    private func videoLink(_ urlStr: String) -> some View {
        if let url = URL(string: urlStr) {
            Link((urlStr.split(separator: "/").last ?? ""), destination: url)
        } else {
            EmptyView()
        }
        
    }
}

#Preview {
    ContentView()
}
