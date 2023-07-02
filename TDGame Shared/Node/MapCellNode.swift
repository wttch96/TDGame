//
//  MapCell.swift
//  TDGame
//
//  Created by Wttch on 2023/6/28.
//

import Foundation
import SpriteKit

class MapCellNode: SKNode {
    let type: MapCellType
    let isRoad: Bool
    
    static let size: Double = 72
    private static let padding: Double = 4
    
    private let path: CGMutablePath
    private var node: SKShapeNode
    
    private var tower: TowerBaseNode?
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    init(type: MapCellType, isRoad: Bool = false) {
        self.type = type
        self.isRoad = isRoad
        
        self.path = MapCellNode.borderPath()
        
        self.node = SKShapeNode(path: path)
        node.fillColor = type.backgroud
        super.init()
        self.name = "MapCell"
        self.zPosition = ZIndex.map
        addChild(node)
    }
    
    func constructTower() {
        let tower = TowerBaseNode(color: NSColor.purple.cgColor)
        let offset = Double(MapCellNode.size / 2)
        tower.position = CGPoint(x: self.position.x + offset, y: self.position.y + offset)
        parent!.addChild(tower)
        tower.zPosition = 100
        self.tower = tower
    }
    
    private static func borderPath() -> CGMutablePath {
        let path = CGMutablePath()
        path.move(to: CGPoint(x: padding, y: padding))
        path.addLine(to: CGPoint(x: size - 2 * padding, y: padding))
        path.addLine(to: CGPoint(x: size - 2 * padding, y: size - 2 * padding))
        path.addLine(to: CGPoint(x: padding, y: size - 2 * padding))
        path.addLine(to: CGPoint(x: padding, y: padding))
        return path
    }
}

extension MapCellNode {
    var canConstruct: Bool {
        return type == .empty && tower == nil
    }
}
