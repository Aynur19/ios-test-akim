//
//  SecondView.swift
//  TestWork1
//
//  Created by Aynur Nasybullin on 19.05.2024.
//

import SwiftUI

struct SecondView: View {
    typealias Colors = Palette2
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        ZStack {
            Colors.background.color
                .ignoresSafeArea()
            
            VStack(spacing: .zero) {
                StaticUI.crossBtn(isLeft: true) { coordinator.pop() }
                
                Icons.background2.image
                    .resizable()
                    .padding(.bottom, 14)
             
                centerView
                bottomBtns
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 16)
            .ignoresSafeArea()
        }
        .foregroundStyle(Colors.primaryLabel.color)
    }
    
    private var centerView: some View {
        VStack(spacing: 12) {
            topLabels
            priceBtn1
            priceBtn2
            continueBtn
        }
        .padding(.bottom, 16)
    }
    
    private var topLabels: some View {
        VStack(spacing: 8) {
            Text("Join the enjoyable learning")
                .font(.system(size: 39, weight: .regular))
                .lineLimit(2, reservesSpace: true)
            Text("Enjoy the lessons with your favorite app. Cancel anytime.")
                .font(.system(size: 14, weight: .regular))
                .lineLimit(2, reservesSpace: true)
        }
        .multilineTextAlignment(.center)
        .foregroundStyle(Colors.primaryLabel2.color)
    }
    
    private var priceBtn1: some View {
        ZStack {
            Button(
                action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                label: {
                    VStack(spacing: 4) {
                        HStack {
                            Text("12 months")
                            Spacer()
                            Text("$99.99")
                        }
                        
                        
                        HStack {
                            Text("7 days free trial")
                                .foregroundStyle(Colors.darkGrayLabel.color)
                            Spacer()
                            Text("$1.96 / week")
                                .foregroundStyle(Colors.secondaryLabel.color)
                        }
                        .font(.system(size: 14, weight: .medium))
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .foregroundStyle(Colors.primaryLabel.color)
                }
            )
            .buttonStyle(CustomButtonStyle(.priceMonths12))
            .foregroundStyle(Color.white)
            .font(.system(size: 16, weight: .medium))
        }
    }
    
    private var priceBtn2: some View {
        Button(
            action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
            label: {
                
                VStack(alignment: .trailing, spacing: 4) {
                    HStack {
                        Text("12 weeks")
                        Spacer()
                        Text("$39.96")
                    }
                    
                    Text("$3.3 / week")
                        .foregroundStyle(Colors.secondaryLabel.color)
                        .font(.system(size: 14, weight: .medium))
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 11)
            }
        )
        .buttonStyle(CustomButtonStyle(.priceWeeks12))
        .font(.system(size: 16, weight: .medium))
    }
    
    private var continueBtn: some View {
        Button(
            action: { },
            label: {
                Text("Continue")
                    .padding(.vertical, 18)
            }
        )
        .buttonStyle(CustomButtonStyle(.continue2))
        .foregroundStyle(Colors.continueBtnLabel.color)
        .font(.system(size: 17, weight: .bold))
        .padding(.top, 4)
    }
    
    private var bottomBtns: some View {
        HStack(spacing: .zero) {
            Button(
                action: { },
                label: { bottomBtnLabel("Terms") }
            )
            Spacer()
            Button(
                action: { },
                label: { bottomBtnLabel("Privacy") }
            )
            
            Spacer()
            Button(
                action: { },
                label: { bottomBtnLabel("Restore") }
            )
        }
        .font(.system(size: 15))
    }
    
    private func bottomBtnLabel(_ title: String) -> some View {
        Text(title)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
    }
}

#Preview {
    SecondView()
}
