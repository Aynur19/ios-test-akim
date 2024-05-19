//
//  Icons.swift
//  TestWork1
//
//  Created by Aynur Nasybullin on 17.05.2024.
//

import SwiftUI

enum Icons: String {
    case background1
    case background2
    
    case cross
    
    case premiumFeatureLock
    case premiumFeatureNotify
    case premiumFeatureStar
    
    var image: Image { .init(self.rawValue.kUppercased()) }
}
