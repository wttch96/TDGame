//
//  MapCellGraphics.swift
//  TDGame
//
//  Created by Wttch on 2024/3/13.
//

import AppKit
import Foundation

class MapCellGraphics {
    static let borderColor = NSColor(named: ColorKeys.MAP_CELL_BORDER.rawValue)
    static func create(backgroundColor: NSColor, systemName: String, color: NSColor) -> NSImage? {
        let path = CGMutablePath()
        path.addRect(CGRect(origin: .zero, size: Constants.cellSize))
        
        let symbolImage = SystemSymbolImage.create(systemName: systemName, size: 8, color: color)
        
        let ctx = CGContext(data: nil,
                            width: Int(Constants.cellSize.width),
                            height: Int(Constants.cellSize.height),
                            bitsPerComponent: 8, bytesPerRow: 4 * Int(Constants.cellSize.height),
                            space: CGColorSpaceCreateDeviceRGB(),
                            bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue)
        
        ctx?.setFillColor(backgroundColor.cgColor)
        ctx?.fill([CGRect(origin: .zero, size: Constants.cellSize)])
        
        ctx?.setStrokeColor(.white)
        ctx?.setLineWidth(1)
        ctx?.addRect(CGRect(origin: .zero + (0.5, 0.5), size: Constants.cellSize - (1, 1)))
        ctx?.drawPath(using: .stroke)
        
        
        ctx?.draw(symbolImage!, in: CGRect(origin: .zero + ((Constants.cellSize.width - CGFloat(symbolImage!.width))/2, (Constants.cellSize.height - CGFloat(symbolImage!.height))/2), size: CGSize(width: symbolImage!.width, height: symbolImage!.height)), byTiling: false)
        
        if let cgImage = ctx?.makeImage() {
            return NSImage(cgImage: cgImage, size: NSSize(width: Constants.cellSize.width, height: Constants.cellSize.height))
        }
        
        return nil
    }
}
