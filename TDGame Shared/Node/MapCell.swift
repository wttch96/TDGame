//
//  MapCell.swift
//  TDGame
//
//  Created by Wttch on 2023/6/28.
//

import Foundation
import SpriteKit

class MapCell: SKNode {
    let type: MapCellType
    let isRoad: Bool
    
    private let size: Double = 72
    private let padding: Double = 4
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    init(type: MapCellType, isRoad: Bool = false) {
        self.type = type
        self.isRoad = isRoad
        super.init()
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: padding, y: padding))
        path.addLine(to: CGPoint(x: size - 2 * padding, y: padding))
        path.addLine(to: CGPoint(x: size - 2 * padding, y: size - 2 * padding))
        path.addLine(to: CGPoint(x: padding, y: size - 2 * padding))
        path.addLine(to: CGPoint(x: padding, y: padding))
        
        let node = SKShapeNode(path: path)
        if !isRoad {
            node.fillColor = type.backgroud
        } else {
            node.fillColor = .systemGreen
        }
        
        addChild(node)
    }
}
