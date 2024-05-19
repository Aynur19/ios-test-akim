//
//  FirstView.swift
//  TestWork1
//
//  Created by Aynur Nasybullin on 10.05.2024.
//

import SwiftUI

struct FirstView: View {
    @EnvironmentObject private var coordinator: Coordinator
    typealias Colors = Palette1
    
    var body: some View {
        ZStack {
            Icons.background1.image
                .ignoresSafeArea()
            
            backgroundGradient.ignoresSafeArea()
            
            VStack(spacing: .zero) {
                StaticUI.crossBtn(isLeft: false) { coordinator.pop() }
                Spacer()
                product
            }
            .padding(.horizontal, 20)
                
        }
        .foregroundStyle(Colors.primaryLabel.color)
    }
    
    private var backgroundGradient: LinearGradient {
        .init(
            colors: [
                Colors.backgroundTop.color,
                Colors.backgroundTop.color,
                Colors.backgroundMiddle.color,
                Colors.backgroundBottom.color
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    private var product: some View {
        VStack(spacing: 12) {
            premiumFeatures
            VStack(spacing: 16) {
                priceBtn1
                priceBtn2
                continueBtn
                bottomBtns
            }
        }
        .padding(.bottom, 16)
    }
    
    private var premiumFeatures: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Get Premium Access")
                .font(.system(size: 39))
            
            feature(
                icon: .premiumFeatureLock,
                title: "Today",
                desciption: "Enjoy full access to advanced features"
            )
            
            feature(
                icon: .premiumFeatureNotify,
                title: "In 5 days",
                desciption: "Trial ending reminder"
            )
            
            feature(
                icon: .premiumFeatureStar,
                title: "In 7 days",
                desciption: "Automatic payment, cancel anytime"
            )
        }
    }
    
    private func feature(icon: Icons, title: String, desciption: String) -> some View {
        HStack(spacing: 8) {
            icon.image
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 17))
                
                Text(desciption)
                    .font(.system(size: 13))
                    .opacity(0.7)
            }
        }
    }
    
    private var priceBtn1: some View {
        ZStack {
            Button(
                action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                label: {
                    VStack(spacing: 4) {
                        HStack {
                            Text("1 year")
                            Spacer()
                            Text("$99.99")
                        }
                        
                        
                        HStack {
                            Text("7 days free trial")
                            Spacer()
                            //                        Text("$99.99")
                        }
                        .font(.system(size: 14))
                        .foregroundStyle(Colors.secondaryLabel.color)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                }
            )
            .buttonStyle(CustomButtonStyle(.priceYear1))
            
        }
    }
    
    private var priceBtn2: some View {
        Button(
            action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
            label: {
                HStack {
                    Text("1 week")
                    Spacer()
                    Text("$2.99")
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 22)
            }
        )
        .buttonStyle(CustomButtonStyle(.priceWeek1))
    }
    
    private var continueBtn: some View {
        Button(
            action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
            label: {
                Text("Continue")
                    .padding(.vertical, 18)
            }
        )
        .buttonStyle(CustomButtonStyle(.continue1))
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
    FirstView()
}





