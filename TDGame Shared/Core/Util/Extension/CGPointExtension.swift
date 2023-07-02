//
//  CGPointExtension.swift
//  TDGame
//
//  Created by Wttch on 2024/3/13.
//

import Foundation

infix operator --

extension CGPoint {
    static func | (lhs: CGPoint, y: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x, y: lhs.y + y)
    }
    
    static func -- (lhs: CGPoint, x: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x + x, y: lhs.y)
    }
    
    static func + (lhs: CGPoint, rhs: (x: CGFloat, y: CGFloat)) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}
