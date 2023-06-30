//
//  UIPanel.swift
//  TDGame
//
//  Created by Wttch on 2023/6/29.
//

import Foundation
import SpriteKit

class UIPanel: SKNode {
    private let panelWidth: CGFloat = 1000
    private let panelHeight: CGFloat = 120
    private let borderColor: SKColor = .cyan
    private let fillColor: SKColor = SKColor(red: 0.2, green: 0.1, blue: 0.8, alpha: 0.4)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let node = SKShapeNode(rect: CGRect(x: 0, y: 0, width: panelWidth, height: panelHeight), cornerRadius: 16)
        node.strokeColor = .yellow
        node.fillColor = fillColor
        node.glowWidth = 2
        node.lineWidth = 8
        node.position = CGPoint(x: -panelWidth / 2, y: 0)
        addChild(node)
    }
}
