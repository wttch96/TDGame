//
//  TowerNode.swift
//  TDGame
//
//  Created by Wttch on 2023/6/30.
//

import Foundation
import SpriteKit

class TowerNode: SKNode {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let topNode = SKSpriteNode(texture: SKTexture(imageNamed: "tower1-top"))
        addChild(topNode)
        let bottomNode = SKSpriteNode(texture: SKTexture(imageNamed: "tower1-bottom"))
        addChild(bottomNode)
        self.setScale(0.5)
    }
    
    override init() {
        super.init()
        
        let topNode = SKSpriteNode(texture: SKTexture(imageNamed: "tower1-top"))
        addChild(topNode)
        let bottomNode = SKSpriteNode(texture: SKTexture(imageNamed: "tower1-bottom"))
        addChild(bottomNode)
        self.setScale(0.5)
        
        self.run(SKAction.rotate(byAngle: .pi / 2, duration: 2))
    }
}
