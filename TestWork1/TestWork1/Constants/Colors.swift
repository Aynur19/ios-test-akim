//
//  Colors.swift
//  TestWork1
//
//  Created by Aynur Nasybullin on 10.05.2024.
//

import SwiftUI

enum Palette1: String {
    // MARK: Background
    case backgroundTop
    case backgroundMiddle
    case backgroundBottom
    
    // MARK: Buttons
    case continueBtnBg_Bottom1
    case continueBtnBg_Bottom2
    
    case continueBtnBg_Top1
    case continueBtnBg_Top2
    
    case crossBtnBg
    case crossBtnBorder
    
    case priceWeek1BtnBg
    case priceYear1BtnBg
    case priceYear1BtnBorder
    
    
    // MARK: Labels
    case opacityLabel
    case primaryLabel
    case secondaryLabel
    
    var color: Color { .init(colorName) }
    
    private var colorName: String { "Palette1/\(self.rawValue.kUppercased())"}
}


enum Palette2: String {
    // MARK: Background
    case background
    
    // MARK: Buttons
    case continueBtnBg
    case priceMonths12BtnBg
    case priceMonths12BtnBorder
    case priceWeeks12BtnBg
    case priceWeeks12BtnBorder
    
    // MARK: Labels
    case continueBtnLabel
    case darkGrayLabel
    case primaryLabel
    case primaryLabel2
    case secondaryLabel
    
    var color: Color { .init(colorName) }
    
    private var colorName: String { "Palette2/\(self.rawValue.kUppercased())"}
}
