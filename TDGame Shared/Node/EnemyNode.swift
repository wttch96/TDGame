//
//  EnemyNode.swift
//  TDGame
//
//  Created by Wttch on 2023/6/29.
//

import Foundation
import SpriteKit

class EnemyNode: SKNode {
    let path: [CGPoint]
    
    required init?(coder aDecoder: NSCoder) {
        self.path = []
        super.init(coder: aDecoder)
    }
    
    init(path: [CGPoint]) {
        self.path = path
        super.init()
        let shape = SKShapeNode(circleOfRadius: 16)
        shape.fillColor = .systemPink
        addChild(shape)
    }
    
}
