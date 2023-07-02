//
//  CursorUtil.swift
//  TDGame
//
//  Created by Wttch on 2024/3/13.
//

import Foundation
import SpriteKit

class CursorUtil {
    /// 生成一个四个直角的矩形选择光标。
    /// - Parameters:
    ///   - size: 光标的大小
    ///   - cursorLength: 光标的直角的边长
    /// - Returns: 光标路径
    static func createPath(size: CGSize, cursorLength l: CGFloat) -> CGPath {
        let path = CGMutablePath()
        // 一半长度
        let hl: CGFloat = l / 2
        // 左下角
        path.move(to: CGPoint(x: 0, y: l))
        path.addLine(to: CGPoint(x: 0, y: hl))
        path.addArc(center: CGPoint(x: hl, y: hl), radius: hl, startAngle: .pi, endAngle: .pi * 3 / 2, clockwise: false)
        path.addLine(to: CGPoint(x: l, y: 0))
        // 左上角
        path.move(to: CGPoint(x: l, y: size.height))
        path.addLine(to: CGPoint(x: hl, y: size.height))
        path.addArc(center: CGPoint(x: hl, y: size.height) | -hl, radius: hl, startAngle: .pi / 2, endAngle: .pi, clockwise: false)
        path.addLine(to: CGPoint(x: 0, y: size.height - l))
        // 右上角
        path.move(to: CGPoint(x: size.width, y: size.height - l))
        path.addLine(to: CGPoint(x: size.width, y: size.height - hl))
        path.addArc(center: CGPoint(x: size.width - hl, y: size.height - hl), radius: hl, startAngle: 0, endAngle: .pi / 2, clockwise: false)
        path.addLine(to: CGPoint(x: size.width - l, y: size.height))
        // 右下角
        path.move(to: CGPoint(x: size.width - l, y: 0))
        path.addLine(to: CGPoint(x: size.width - hl, y: 0))
        path.addArc(center: CGPoint(x: size.width - hl, y: hl), radius: hl, startAngle: -.pi / 2, endAngle: 0, clockwise: false)
        path.addLine(to: CGPoint(x: size.width, y: l))

        return path
    }
}
