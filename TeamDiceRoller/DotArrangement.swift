//
//  DotArrangement.swift
//  TeamDiceRoller
//
//  Created by Thane Heninger on 10/31/20.
//

import Foundation

struct DotArrangement {
    let quantity: Int
    
    static private let max3x3 = 9
    static private let max3x3Sides = max3x3 / 3 * 2
    
    static private let max5x5 = 25
    static private let max5x5Sides = max5x5 / 5 * 2
    static private let max5x5Ring = 4 * 4
    
    private var in3x3: Bool {
        quantity <= Self.max3x3
    }
    
    private func sideFor3x3(with quantity: Int) -> Int {
        if quantity <= Self.max3x3Sides {
            return quantity / 2
        } else {
            return Self.max3x3Sides / 2
        }
    }
    
    var farSideCount: Int {
        if in3x3 {
            return sideFor3x3(with: quantity)
        } else {
            return 5
        }
    }
        
    var midSideCount: Int {
        if quantity < Self.max5x5Sides {
            return 0
        } else if quantity < Self.max5x5Ring {
            return sideFor3x3(with: quantity - Self.max5x5Sides)
        } else {
            return 2 + sideFor3x3(with: quantity - Self.max5x5Ring)
        }
    }
    
    private func centerFor3x3(with quantity: Int) -> Int {
        if quantity > Self.max3x3Sides {
            return quantity - Self.max3x3Sides
        } else {
            return quantity % 2
        }
    }
    
    var centerCount: Int {
        if quantity < Self.max5x5Sides {
            return centerFor3x3(with: quantity)
        } else if quantity < Self.max5x5Ring {
            return centerFor3x3(with: quantity - Self.max5x5Sides)
        } else {
            return 2 + centerFor3x3(with: quantity - Self.max5x5Ring)
        }
    }
}
