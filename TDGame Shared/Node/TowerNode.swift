//
//  TowerNode.swift
//  TDGame
//
//  Created by Wttch on 2023/6/30.
//

import Foundation
import SpriteKit

class TowerNode: SKNode {
    // 旋转速度
    private var rotateSpeed: CGFloat = .pi * 2
    // 攻击范围
    public var attackRange: CGFloat = 4.0 * MapCellNode.size
    // 攻击目标
    var attackTargetEnemy: EnemyNode?
    // 旋转动画
    var rotateAction: SKAction?
    
    var topNode: SKSpriteNode
    
    var test: SKShapeNode?
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override init() {
        topNode = SKSpriteNode(texture: SKTexture(imageNamed: "tower1-top"))
        super.init()
        topNode.setScale(0.5)
        addChild(topNode)
        let bottomNode = SKSpriteNode(texture: SKTexture(imageNamed: "tower1-bottom"))
        bottomNode.setScale(0.5)
        addChild(bottomNode)
        let rangePath = CGMutablePath()
        rangePath.addArc(center: CGPoint(x: 0, y: 0), radius: attackRange, startAngle: 0, endAngle: .pi * 2, clockwise: false)
        let rangeNode = SKShapeNode(path: rangePath)
        rangeNode.strokeColor = .green
        rangeNode.lineWidth = 2
        addChild(rangeNode)
        self.zPosition = ZIndex.tower
        
        var path = CGMutablePath()
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: 100, y: 100))
        self.test = SKShapeNode(path: path)
        self.test?.strokeColor = .red
        self.test?.lineWidth = 1
        self.test?.glowWidth = 3
        self.addChild(self.test!)
    }
    
    func rotate(target: CGPoint) {
        topNode.removeAction(forKey: "rotate")
        
        let angel = self.position.angle(to: target)
        var byAngel = angel - topNode.zRotation - .pi / 2
        if byAngel < 0 {
            byAngel += Double.pi * 2
        }
        print("angel: \(Int(angel / .pi * 180)) byAngel:\(Int(byAngel / .pi * 180)) zRotation:\(Int(zRotation / .pi * 180))")
        
        topNode.run(SKAction.rotate(byAngle: byAngel, duration: byAngel / rotateSpeed), withKey: "rotate")
    }
}
