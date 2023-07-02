//
//  Map.swift
//  TDGame iOS
//
//  Created by Wttch on 2023/7/2.
//

import Foundation


public struct GameMap {
    let cells: [[MapCell]]
    let startPoint: Point
    let endPoint: Point
    let widthCount: Int
    let heightCount: Int
    var path: [Point] = []
    
    init?(name: String) {
        do {
            if let url = Bundle.main.url(forResource: name, withExtension: nil) {
                let data = try Data(contentsOf: url)
                let cellTypes = try JSONDecoder().decode([[MapCellType]].self, from: data)
                guard !cellTypes.isEmpty else { return nil }
                
                self.heightCount = cellTypes.count
                self.widthCount = cellTypes[0].count
                
                var startPoint: Point? = nil
                var endPoint: Point? = nil
                var cells: [[MapCell]] = []
                
                for col in 0..<cellTypes.count {
                    // i 实际是列
                    var colCells: [MapCell] = []
                    for rol in 0..<cellTypes[col].count {
                        let point = Point(rol, col)
                        // j 实际是行
                        if startPoint == nil && cellTypes[col][rol] == .startPoint {
                            startPoint = point
                        }
                        if endPoint == nil && cellTypes[col][rol] == .endPoint {
                            endPoint = point
                        }
                        
                        let mapCell = MapCell(point: point, type: cellTypes[col][rol])
                        
                        colCells.append(mapCell)
                    }
                    cells.append(colCells)
                }
                guard let startPoint = startPoint, let endPoint = endPoint else { return nil }
                
                self.startPoint = startPoint
                self.endPoint = endPoint
                self.cells = cells
                self.path = bfs()
                return
            }
        } catch let error {
            print(error.localizedDescription)
        }
        return nil
    }
    
    subscript(index: Point) -> MapCell {
        return cells[index.y][index.x]
    }
    
}

struct MapCell {
    let point: Point
    let type: MapCellType
}

extension GameMap {
    func bfs() -> [Point] {
        var queue: [Point] = []
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: widthCount), count: heightCount)
        var pre: [[Point]] = Array(repeating: Array(repeating: Point.DEFAULT, count: widthCount), count: heightCount)
        
        queue.append(startPoint)
        visited[startPoint.y][startPoint.x] = true
        
        while !queue.isEmpty {
            let curPos: Point = queue.removeFirst()
            if curPos == endPoint {
                break
            }
            
            // 四个方向
            let target = [Point(-1, 0), Point(1, 0), Point(0, -1), Point(0, 1)]
            for t in target {
                let nextPos = curPos + t
                if valid(nextPos) && !cells[nextPos.y][nextPos.x].isEmpty && !visited[nextPos.y][nextPos.x] {
                    visited[nextPos.y][nextPos.x] = true
                    queue.append(nextPos)
                    pre[nextPos.y][nextPos.x] = curPos
                }
            }
        }
        
        
        var curPos = pre[endPoint.y][endPoint.x]
        var res: [Point] = []
        while curPos != Point.DEFAULT && curPos != startPoint {
            res.append(curPos)
            curPos = pre[curPos.y][curPos.x]
        }
        
        res.append(startPoint)
        
        res = res.reversed()
        res.append(endPoint)
        return res
    }
    
    
    func valid(_ pos: Point) -> Bool {
        if cells.isEmpty { return false }
        
        if pos.y >= 0 && pos.y < heightCount {
            if pos.x >= 0 && pos.x < widthCount {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
}


extension MapCell {
    var isEmpty: Bool {
        return type == .empty
    }
}
