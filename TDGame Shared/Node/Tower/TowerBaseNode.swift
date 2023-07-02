//
//  TowerBaseNode.swift
//  TDGame
//
//  Created by Wttch on 2024/3/13.
//

import Foundation
import SpriteKit

/// 所有的防御塔基类。
/// 目前只考虑 1x1 大小的。
class TowerBaseNode: SKNode {
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    let color: CGColor
    
    init(color: CGColor) {
        self.color = color
        super.init()
        
        let borderShape = borderShape()
        
        let innerBorder = innerBorderShape()
        
        self.addChildToCenter(backgroundShape())
        self.addChildToCenter(borderShape)
        self.addChildToCenter(innerBorder)
    }
    
    private func backgroundShape() -> SKShapeNode {
        let path = CGMutablePath()
        path.addRoundedRect(in: CGRect(origin: CGPoint.zero, size: Constants.cellSize), cornerWidth: 8, cornerHeight: 8)
        let shape = SKShapeNode(path: path)
        shape.fillColor = Constants.backgroundColor
        
        return shape
    }
    
    private func borderShape() -> SKShapeNode {
        let path = CGMutablePath()
        path.addRoundedRect(in: CGRect(origin: CGPoint.zero, size: Constants.cellSize), cornerWidth: 8, cornerHeight: 8)
        let shape = SKShapeNode(path: path)
        shape.fillColor = NSColor(cgColor: self.color.copy(alpha: 0.2)!)!
        
        shape.strokeColor = NSColor(cgColor: self.color)!
        shape.lineWidth = 4
        return shape
    }
    
    private func innerBorderShape() -> SKShapeNode {
        
        let path = CursorUtil.createPath(size: Constants.cellInnerBorderSize, cursorLength: 16)
        let borderShape = SKShapeNode(path: path)
        
        
        borderShape.strokeColor = .white
        borderShape.lineWidth = 2
        return borderShape
    }
}
