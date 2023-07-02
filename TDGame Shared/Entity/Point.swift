//
//  Point.swift
//  TDGame iOS
//
//  Created by Wttch on 2023/7/2.
//

import Foundation


struct Point: Equatable {
    let x: Int
    let y: Int
    
    static let DEFAULT = Point(-1, -1)
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    static func == (lhs: Point, rhs: Point) -> Bool {
        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
    }
    
    static func + (lhs: Point, rhs: Point) -> Point {
        return Point(lhs.x + rhs.x, lhs.y + rhs.y)
    }
}
