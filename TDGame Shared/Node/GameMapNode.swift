//
//  Map.swift
//  TDGame
//
//  Created by Wttch on 2023/6/28.
//

import Foundation
import SpriteKit

// 游戏场景、相关的逻辑都在这个类里进行
// 将此 Node 置于 Scene 中，可以不用再复杂考虑子节点的位置
class GameMapNode: SKNode {
    let map: GameMap
    
    var towers: [TowerBaseNode] = []
    var enemies: [EnemyNode] = []
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    var height: Double {
        return Double(map.heightCount) * MapCellNode.size
    }
    
    var width: Double {
        return Double(map.widthCount) * MapCellNode.size
    }
    
    init?(name: String) {
        if let map = GameMap(name: name) {
            self.map = map
            super.init()
            for i in 0..<map.heightCount {
                for j in 0..<map.widthCount {
                    let node = MapCellNode(type: map.cells[i][j].type, isRoad: map.path.contains(where: { $0 == Point(i, j) }))
                    node.position = CGPoint(x: Double(j) * MapCellNode.size, y: Double(map.heightCount - 1 - i) * MapCellNode.size)
                    addChild(node)
                }
            }
        } else {
            return nil
        }
    }
    
    func update(_ currentTime: TimeInterval) {
        towers = children.filter({ $0 is TowerBaseNode }).map({ $0 as! TowerBaseNode })
        enemies = children.filter({ $0 is EnemyNode }).map({ $0 as! EnemyNode })
        checkEnemyInRange()
    }
    
    private func checkEnemyInRange() {
//        for tower in towers {
//            if let enemy = enemies.first { $0.position.distance(to: tower.position) < tower.attackRange } {
//                tower.rotate(target: enemy.position)
//            }
//        }
    }
}

extension GameMapNode {
    
    func spawn() {
        let path = map.path.map { point in
            CGPoint(x: Double(point.x) * MapCellNode.size + MapCellNode.size / 2, y: Double(map.heightCount - 1 - point.y) * MapCellNode.size + MapCellNode.size / 2)
        }
        let enemy = EnemyNode(path: path)
        enemy.position = path[0]
        addChild(enemy)
        
        var tos: [SKAction] = []
        for i in 0..<path.count {
            if i >= 1 {
                tos.append( SKAction.run {
                })
                tos.append(SKAction.move(to: path[i], duration: 1))
            }
        }
        tos.append(SKAction.run {
            // 到终点
        })
        tos.append(SKAction.removeFromParent())
        enemy.run(SKAction.sequence(tos))
    }
}
