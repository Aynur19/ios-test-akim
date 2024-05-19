//
//  ButtonStyles.swift
//  TestWork1
//
//  Created by Aynur Nasybullin on 17.05.2024.
//

import SwiftUI

enum ButtonStyles {
    case continue1
    case continue2
    case priceWeek1
    case priceWeeks12
    case priceYear1
    case priceMonths12
}

struct CustomButtonStyle: ButtonStyle {
    let style: ButtonStyles
    
    
    
    init(_ style: ButtonStyles) {
        self.style = style
    }
    
    func makeBody(configuration: Configuration) -> some View {
        switch style {
            case .continue1:
                continueBtnStyle1.makeBody(configuration: configuration)
            case .continue2:
                continueBtnStyle2.makeBody(configuration: configuration)
            case .priceWeek1:
                priceWeek1Style.makeBody(configuration: configuration)
            case .priceWeeks12:
                priceWeeks12Style.makeBody(configuration: configuration)
            case .priceYear1:
                priceYear1Style.makeBody(configuration: configuration)
            case .priceMonths12:
                priceMonths12Style.makeBody(configuration: configuration)
        }
    }
}

extension CustomButtonStyle {
    private var continueBtnStyle1: some ButtonStyle {
        ContinueButtonStyle(
            background1: { continueBtn1Bg1 },
            background2: { continueBtn1Bg2 },
            cornerRadius: 130
        )
    }
    
    private var continueBtnStyle2: some ButtonStyle {
        ContinueButtonStyle(
            background1: { Palette2.continueBtnBg.color },
            background2: { Palette2.continueBtnBg.color },
            cornerRadius: 8
        )
    }
    
    private var continueBtn1Bg1: LinearGradient {
        .init(
            colors: [
                Palette1.continueBtnBg_Top1.color,
                Palette1.continueBtnBg_Bottom1.color
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    private var continueBtn1Bg2: LinearGradient {
        .init(
            colors: [
                Palette1.continueBtnBg_Top2.color,
                Palette1.continueBtnBg_Bottom2.color
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }
}

extension CustomButtonStyle {
    private var priceWeek1Style: some ButtonStyle {
        PriceButtonStyle(
            background: { Palette1.priceWeek1BtnBg.color },
            border: { Color.clear },
            cornerRadius: 8,
            borderWidth: 0,
            isBestChoise: false
        )
    }
    
    private var priceWeeks12Style: some ButtonStyle {
        PriceButtonStyle(
            background: { Palette2.priceWeeks12BtnBg.color },
            border: { Palette2.priceWeeks12BtnBorder.color },
            cornerRadius: 8,
            borderWidth: 1,
            isBestChoise: false
        )
    }
    
    private var priceYear1Style: some ButtonStyle {
        PriceButtonStyle(
            background: { Palette1.priceYear1BtnBg.color },
            border: { Palette1.priceYear1BtnBorder.color },
            cornerRadius: 8,
            borderWidth: 2,
            isBestChoise: true
        )
    }
    
    private var priceMonths12Style: some ButtonStyle {
        PriceButtonStyle(
            background: { Palette2.priceMonths12BtnBg.color },
            border: { Palette2.priceMonths12BtnBorder.color },
            cornerRadius: 8,
            borderWidth: 2,
            isBestChoise: true
        )
    }
}


// MARK: Preview
private struct ButtonStylesPreview: View {
    var body: some View {
        ZStack {
            Icons.background1.image
                .ignoresSafeArea()
            
            VStack {
                btn.buttonStyle(CustomButtonStyle(ButtonStyles.continue1))
                btn.buttonStyle(CustomButtonStyle(ButtonStyles.priceWeek1))
                btn.buttonStyle(CustomButtonStyle(ButtonStyles.priceYear1))
            }
            .padding()
        }
        .foregroundStyle(Palette1.primaryLabel.color)
        .font(.system(size: 17, weight: .bold))
    }
    
    private var btn: some View {
        Button(
            action: { print("Pressed") },
            label: { Text("Continue").padding() }
        )
        .padding()
    }
}


#Preview { ButtonStylesPreview() }
