//
//  StringProtocolExt.swift
//  TestWork1
//
//  Created by Aynur Nasybullin on 17.05.2024.
//

extension StringProtocol {
    func kUppercased(_ k: Int = 1) -> String {
        if k >= self.count { return self.uppercased() }
        
        return prefix(k).uppercased() + dropFirst(k)
    }
}
