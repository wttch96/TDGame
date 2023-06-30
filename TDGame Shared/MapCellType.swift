//
//  MapCell.swift
//  TDGame
//
//  Created by Wttch on 2023/6/28.
//

import Foundation
import SpriteKit

enum MapCellType: Int, Decodable {
    case startPoint = 2
    case endPoint = 3
    case road = 1
    case empty = 0
}

extension MapCellType {
    var backgroud: SKColor {
        switch self {
        case .road: return SKColor(white: 1, alpha: 0.2)
        case .startPoint: return .yellow
        case .endPoint: return .red
        case .empty: return .black
        }
    }
}
