//
//  GameScene.swift
//  TDGame Shared
//
//  Created by Wttch on 2023/6/28.
//

import SpriteKit

class GameScene: SKScene {
    private let map: GameMapNode
    private var uiPanel: UIPanel?
    private var labelNode: SKLabelNode?
    
    required init?(coder aDecoder: NSCoder) {
        if let map = GameMapNode(name: "map1.json") {
            map.position = CGPoint(x: -map.width / 2, y: -map.height / 2)
            self.map = map
        } else {
            return nil
        }
        super.init(coder: aDecoder)
        addChild(map)
        uiPanel = childNode(withName: "uiPanel") as? UIPanel
        uiPanel?.isHidden = true
        labelNode = childNode(withName: "label") as? SKLabelNode
        
        // addChild(TowerBaseNode(color: NSColor.purple.cgColor))
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
    
    
    override func keyDown(with event: NSEvent) {
        guard var moveVector = KeyCodeUtil.toNormVector(event.characters) else { return }
        let speed: CGFloat = 800
        moveVector = moveVector * speed
            
        camera?.removeAction(.ACTION_CAMERA_MOVE)
        camera?.run(
            SKAction.sequence([
                .move(by: moveVector, duration: 0.5),
            ]),
            withKey: .ACTION_CAMERA_MOVE
        )
      
    }
    
    override func didMove(to view: SKView) {
        self.setUpScene()
    }
    
    
    private var lastSpawnTime: TimeInterval? = nil
    private var lastUpdateTime: TimeInterval? = nil
    
    override func update(_ currentTime: TimeInterval) {
        let fps = 10.0
        
        if lastUpdateTime == nil || currentTime - lastUpdateTime! >= 1.0 / fps {
            lastUpdateTime = currentTime
            map.update(currentTime)
            
            labelNode?.text = "塔:\(map.towers.count), 敌人:\(map.enemies.count)"
        }
        
        if lastSpawnTime == nil || currentTime - lastSpawnTime! >= 1.0 {
            lastSpawnTime = currentTime
            map.spawn()
        }
    }
}

extension GameScene {
    override func mouseDown(with event: NSEvent) {
        if let node = nodes(at: event.location(in: self)).first { $0 is MapCellNode } as? MapCellNode {
            
                node.constructTower()
            
        }
    }
}
