//
//  SystemSymbolImage.swift
//  TDGame
//
//  Created by Wttch on 2024/3/13.
//

import AppKit
import Foundation

class SystemSymbolImage {
    /// 使用 NSImage 读取 SF Symbol 然后将其转换为 CGImage。
    /// - Parameters:
    ///   - systemName: 系统的 SF Symbol 符号的名称
    ///   - size: 字体的大小，太小如果进行图片放大会变糊
    ///   - color: 文字颜色
    /// - Returns: 包含 SF Symbol 的 CGImage
    static func create(systemName: String, size: CGFloat = 48, color: NSColor = .white) -> CGImage? {
        let image = NSImage(systemSymbolName: systemName, accessibilityDescription: nil)
        // 字体大小和颜色
        var config = NSImage.SymbolConfiguration(paletteColors: [color])
        config = config.applying(NSImage.SymbolConfiguration(pointSize: size, weight: .regular))
        
        guard let image = image?.withSymbolConfiguration(config) else { return nil }
        // NSImage --> CGImage
        var rect = NSRect(origin: .zero, size: image.size)
        return image.cgImage(forProposedRect: &rect, context: nil, hints: nil)
    }
}
