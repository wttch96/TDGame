//
//  Map.swift
//  TDGame
//
//  Created by Wttch on 2023/6/28.
//

import Foundation
import SpriteKit

class Map: SKNode {
    private let cells: [[MapCellType]]
    private let startPoint: (Int, Int)?
    private let endPoint: (Int, Int)?
    
    required init?(coder aDecoder: NSCoder) {
        self.cells = []
        self.startPoint = nil
        self.endPoint = nil
        super.init(coder: aDecoder)
    }
    
    var height: Double {
        return Double(cells.count * 72)
    }
    
    var width: Double {
        if cells.isEmpty {
            return 0
        } else {
            return Double(cells[0].count * 72)
        }
    }
    
    init?(name: String) {
        do {
            if let url = Bundle.main.url(forResource: name, withExtension: nil) {
                let data = try Data(contentsOf: url)
                self.cells = try JSONDecoder().decode([[MapCellType]].self, from: data)
                
                
                var startPoint: (Int, Int)? = nil
                var endPoint: (Int, Int)? = nil
                
                for i in 0..<cells.count {
                    for j in 0..<cells[i].count {
                        
                        if startPoint == nil && cells[i][j] == .startPoint {
                            startPoint = (i, j)
                        }
                        if endPoint == nil && cells[i][j] == .endPoint {
                            endPoint = (i, j)
                        }
                    }
                }
                
                self.startPoint = startPoint
                self.endPoint = endPoint
                
                super.init()
               
                let path = bfs()
                
                for i in 0..<cells.count {
                    for j in 0..<cells[i].count {
                        let node = MapCellNode(type: cells[i][j], isRoad: path.contains(where: { $0 == (i, j) }))
                        node.position = CGPoint(x: j * 72, y: (cells.count - 1 - i) * 72)
                        addChild(node)
                    }
                }
            } else {
                return nil
            }
        } catch let _ {
            return nil
        }
    }
    
}

extension Map {
    
    
    
    func bfs() -> [(Int, Int)] {
        var queue: [(Int, Int)] = []
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: cells[0].count), count: cells.count)
        var pre: [[(Int, Int)]] = Array(repeating: Array(repeating: (-1, -1), count: cells[0].count), count: cells.count)
        
        guard let startPoint = self.startPoint else { return [] }
        queue.append(startPoint)
        visited[startPoint.0][startPoint.1] = true
        
        while !queue.isEmpty {
            let curPos: (Int, Int) = queue.removeFirst()
            
            if let endPoint = self.endPoint {
                if curPos.0 == endPoint.0 && curPos.1 == endPoint.1 {
                    break
                }
            }
            
            // 四个方向
            let target = [(-1, 0), (1, 0), (0, -1), (0, 1)]
            for t in target {
                let nextPos = (curPos.0 + t.0, curPos.1 + t.1)
                if valid(nextPos) && cells[nextPos.0][nextPos.1] != .empty && !visited[nextPos.0][nextPos.1] {
                    visited[nextPos.0][nextPos.1] = true
                    queue.append(nextPos)
                    pre[nextPos.0][nextPos.1] = curPos
                }
            }
        }
        
        if let endPoint = self.endPoint, let startPoint = self.startPoint {
            var curPos = pre[endPoint.0][endPoint.1]
            var res: [(Int, Int)] = []
            while curPos != (-1, -1) && curPos != startPoint {
                res.append(curPos)
                curPos = pre[curPos.0][curPos.1]
            }
            
            res.append(startPoint)
            
            res = res.reversed()
            res.append(endPoint)
            return res
        }
        return []
    }
    
    
    func valid(_ pos: (Int, Int)) -> Bool {
        if cells.isEmpty { return false }
        
        if pos.0 >= 0 && pos.0 < cells.count {
            if pos.1 >= 0 && pos.1 < cells[0].count {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    func spawn() {
        let path = bfs().map { i, j in
            CGPoint(x: j * 72 + 36, y: (cells.count - 1 - i) * 72 + 36)
        }
        let enemy = EnemyNode(path: path)
        enemy.position = path[0]
        addChild(enemy)
        
        var tos: [SKAction] = []
        for i in 0..<path.count {
            if i >= 1 {
                tos.append( SKAction.run {
                })
                tos.append(SKAction.move(to: path[i], duration: 0.1))
            }
        }
        tos.append(SKAction.run {
            // 到终点
        })
        tos.append(SKAction.removeFromParent())
        enemy.run(SKAction.sequence(tos))
    }
}
