//
//  GameScene.swift
//  TDGame Shared
//
//  Created by Wttch on 2023/6/28.
//

import SpriteKit

class GameScene: SKScene {
    private let map: Map
    private var uiPanel: UIPanel?
    
    required init?(coder aDecoder: NSCoder) {
        if let map = Map(name: "map1.json") {
            map.position = CGPoint(x: -map.width / 2, y: -map.height / 2)
            self.map = map
        } else {
            return nil
        }
        super.init(coder: aDecoder)
        addChild(map)
        uiPanel = childNode(withName: "uiPanel") as? UIPanel
        uiPanel?.isHidden = true
    }
    
    class func newGameScene() -> GameScene {
        // Load 'GameScene.sks' as an SKScene.
        guard let scene = SKScene(fileNamed: "GameScene") as? GameScene else {
            print("Failed to load GameScene.sks")
            abort()
        }
        
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFill
        
        return scene
    }
    
    func setUpScene() {
        
    }
    
    override func didMove(to view: SKView) {
        self.setUpScene()
    }
    
    
    private var lastSpawnTime: TimeInterval? = nil
    
    override func update(_ currentTime: TimeInterval) {
        if lastSpawnTime == nil || currentTime - lastSpawnTime! >= 1 {
            lastSpawnTime = currentTime
            map.spawn()
        }
    }
}

extension GameScene {
    override func mouseDown(with event: NSEvent) {
        if let node = nodes(at: event.location(in: self)).first { $0 is MapCellNode } as? MapCellNode {
            if node.canConstruct {
                node.constructTower()
            }
        }
    }
}
