//
//  CGSizeExtension.swift
//  TDGame
//
//  Created by Wttch on 2024/3/13.
//

import Foundation
import CoreGraphics

infix operator --

extension CGSize {
    init(_ w: CGFloat, _ h: CGFloat) {
        self.init(width: w, height: h)
    }

    static func | (lhs: CGSize, h: CGFloat) -> CGSize {
        return CGSize(width: lhs.width, height: lhs.height + h)
    }

    static func -- (lhs: CGSize, w: CGFloat) -> CGSize {
        return CGSize(width: lhs.width + w, height: lhs.height)
    }

    static func + (lhs: CGSize, rhs: (w: CGFloat, h: CGFloat)) -> CGSize {
        return CGSize(width: lhs.width + rhs.w, height: lhs.height + rhs.h)
    }
    static func - (lhs: CGSize, rhs: (w: CGFloat, h: CGFloat)) -> CGSize {
        return CGSize(width: lhs.width - rhs.w, height: lhs.height - rhs.h)
    }
}

postfix operator -->

extension CGPath {
    
}
