//
//  CGVectorExtension.swift
//  TDGame
//
//  Created by Wttch on 2024/3/13.
//

import Foundation


extension CGVector {
    static func *(lhs: CGVector, rhs: CGFloat) -> CGVector {
        return CGVector(dx: lhs.dx * rhs, dy: lhs.dy * rhs)
    }
}
