//
//  KeyCodeUtil.swift
//  TDGame
//
//  Created by Wttch on 2024/3/13.
//

import Foundation

class KeyCodeUtil {
    static let keyCode2Vector = [
        "a": CGVector(dx: -1, dy: 0),
        "s": CGVector(dx: 1, dy: 0),
        "w": CGVector(dx: 0, dy: 1),
        "d": CGVector(dx: 0, dy: -1)
    ]

    static func toNormVector(_ keyChar: String?) -> CGVector? {
        guard let keyChar = keyChar else { return nil }
        return keyCode2Vector[keyChar.lowercased()]
    }
}
