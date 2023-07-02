//
//  SKNodeExtension.swift
//  TDGame
//
//  Created by Wttch on 2024/3/13.
//

import Foundation
import SpriteKit

extension SKNode {
    
    /// 添加子节点到当前结点，锚点使用 0, 0，即：将子节点放在当前结点的中间(0, 0)位置。
    /// - Parameters:
    ///   - node: 要添加的节点
    func addChildToCenter(_ node: SKNode) {
        node.position = CGPoint(x: -node.frame.width / 2, y: -node.frame.height / 2)
        self.addChild(node)
    }
    
    /// 获取 SKAction，需要使用自定义的枚举类型作为参数。
    /// - Parameter action: 要获取的 SKAction 的键。(ActionKeys 枚举类型)
    /// - Returns: 获取到的 SKAction
    func action(_ action: ActionKeys) -> SKAction? {
        return self.action(forKey: action.rawValue)
    }
    
    /// 删除 SKAction，需要使用自定义的枚举类型
    /// - Parameter action: 要删除的 SKAction 的键。(ActionKeys枚举类型)
    func removeAction(_ action: ActionKeys) {
        self.removeAction(forKey: action.rawValue)
    }
    
    
    func run(_ action: SKAction, withKey: ActionKeys) {
        self.run(action, withKey: withKey.rawValue)
    }
}
