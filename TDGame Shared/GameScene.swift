//
//  GameScene.swift
//  TDGame Shared
//
//  Created by Wttch on 2023/6/28.
//

import SpriteKit

class GameScene: SKScene {
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
        
        if let map = Map(name: "map1.json") {
            map.position = CGPoint(x: -map.width / 2, y: -map.height / 2)
            addChild(map)
        }
    }
    
    override func didMove(to view: SKView) {
        self.setUpScene()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
