//
//  StaticUI.swift
//  TestWork1
//
//  Created by Aynur Nasybullin on 17.05.2024.
//

import SwiftUI

struct StaticUI {
    static func crossBtn(action: @escaping () -> Void) -> some View {
        Button(
            action: action,
            label: {
                Circle()
                    .fill(Palette1.crossBtnBg.color)
                    .frame(width: 41.92, height: 41.92)
                    .background {
                        Circle()
                            .stroke(
                                Palette1.crossBtnBorder.color,
                                lineWidth: 1.05
                            )
                    }
                    .overlay {
                        Icons.cross.image
                            .resizable()
                            .frame(width: 15.72, height: 15.72, alignment: .center)
                    }
            }
        )
    }
}
