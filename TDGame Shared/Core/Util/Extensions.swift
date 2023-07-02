//
//  Extensions.swift
//  TDGame iOS
//
//  Created by Wttch on 2023/7/3.
//

import Foundation

extension CGPoint {
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    func distance(to: CGPoint) -> CGFloat {
        return CGFloat(hypot(abs(self.x - to.x), abs(self.y - to.y)))
    }
    
    func angle(to: CGPoint) -> CGFloat {
        let originX = to.x - self.x
        let originY = to.y - self.y
        var radians = atan2(originY, originX)
        
        while radians < 0 {
            radians += CGFloat(2 * Double.pi)
        }
        
        return radians
    }
}
extension CGSize {
    static func - (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
    }
}
