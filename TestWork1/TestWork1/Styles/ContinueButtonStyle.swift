//
//  ContinueButtonStyle.swift
//  TestWork1
//
//  Created by Aynur Nasybullin on 17.05.2024.
//

import SwiftUI

struct ContinueButtonStyle<BackgroundType1, BackgroundType2>: ButtonStyle
where BackgroundType1: ShapeStyle, BackgroundType2: ShapeStyle {
    private var background1: BackgroundType1
    private var background2: BackgroundType2
    
    private let cornerRadius: CGFloat
    
    init(
        @ViewBuilder background1: () -> BackgroundType1,
        @ViewBuilder background2: () -> BackgroundType2,
        cornerRadius: CGFloat
    ) {
        self.background1 = background1()
        self.background2 = background2()
        
        self.cornerRadius = cornerRadius
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .background { getBackground(configuration.isPressed) }
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
    
    @ViewBuilder
    private func getBackground(_ isPressed: Bool) -> some View {
        if !isPressed {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(background1)
        } else {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(background2)
        }
    }
}
