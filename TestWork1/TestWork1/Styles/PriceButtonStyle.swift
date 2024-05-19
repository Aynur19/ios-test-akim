//
//  PriceButtonStyle.swift
//  TestWork1
//
//  Created by Aynur Nasybullin on 17.05.2024.
//

import SwiftUI

struct PriceButtonStyle<BackgroundType, BorderType>: ButtonStyle
where BackgroundType: ShapeStyle, BorderType: ShapeStyle {
    private var background: BackgroundType
    private var border: BorderType
    
    private let cornerRadius: CGFloat
    private let borderWidth: CGFloat
    
    private let isBestChoise: Bool
    
    init(
        @ViewBuilder background: () -> BackgroundType,
        @ViewBuilder border: () -> BorderType,
        cornerRadius: CGFloat,
        borderWidth: CGFloat,
        isBestChoise: Bool
    ) {
        self.background = background()
        self.border = border()
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.isBestChoise = isBestChoise
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .background { backgroundView }
            .overlay { overlayView }
        
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
    
    private var backgroundView: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(background)
    }

    @ViewBuilder
    private var overlayView: some View {
        if isBestChoise {
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(border, lineWidth: borderWidth)
                    .overlay { bestChoiceLabel }
            }
        } else {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(border, lineWidth: borderWidth)
        }
    }
    
    private var bestChoiceLabel: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                Text("Best choice")
                    .padding(.vertical, 2)
                    .padding(.horizontal, 8)
                    .background {
                        RoundedRectangle(cornerRadius: 78)
                            .fill(border)
                    }
                    .font(.system(size: 10, weight: .bold))
                    .padding(.top, -7)
                    .padding(.trailing, 8)
            }
        }
    }
}
