//
//  Constants.swift
//  TDGame
//
//  Created by Wttch on 2024/3/13.
//

import Foundation
import AppKit

class Constants {
    static let cellSize = CGSize(width: 48, height: 48)
    static let cellInnerBorderSize = Constants.cellSize - (16, 16)
    
    
    #if os(macOS)
    static let backgroundColor = NSColor.black
    static let cellBorderColor = NSColor.white
    #endif
}
enum ColorKeys: String {
    case MAP_BACKROUND = "MapBackground"
    case MAP_CELL_BORDER = "MapCellBorder"
}

// MARK: ActionKey
enum ActionKeys: String {
    case ACTION_CAMERA_MOVE = "action.camera.move"
}
