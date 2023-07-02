//
//  GlowTowerNode.swift
//  TDGame
//
//  Created by Wttch on 2024/3/11.
//

import Foundation
import SpriteKit
import CoreGraphics

class GlowTowerNode: SKNode {
    var base: SKShapeNode?
    var baseGlow: SKShapeNode?
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override init() {
        super.init()
        
        
        var path = CGMutablePath()
        path.addArc(center: CGPoint.zero, radius: 50, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        
        self.base = SKShapeNode(path: path)
        self.base!.lineWidth = 1
        self.base!.strokeColor = .green
        self.base!.glowWidth = 3
        
        self.baseGlow = SKShapeNode(path: path)
        self.baseGlow!.lineWidth = 2
        self.baseGlow!.strokeColor = .white
        self.baseGlow!.zPosition = 100
        
        
        
        self.base?.blendMode = .replace
        self.addChild(base!)
        self.addChild(baseGlow!)
        
        var image = NSImage(systemSymbolName: "shield", accessibilityDescription: nil)
        
        var config = NSImage.SymbolConfiguration(paletteColors: [.white])
        
        config = config.applying(NSImage.SymbolConfiguration(pointSize: 48, weight: .regular))
        
        image = image?.withSymbolConfiguration(config)
        let texture = SKTexture(image: image!)
        let sprite = SKSpriteNode(texture: texture)
        sprite.size.width = 48
        sprite.size.height = 48
        self.addChild(sprite)
    }
}
