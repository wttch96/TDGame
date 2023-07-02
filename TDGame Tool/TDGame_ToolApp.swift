//
//  TDGame_ToolApp.swift
//  TDGame Tool
//
//  Created by Wttch on 2024/3/11.
//

import SwiftUI

@main
struct TDGame_ToolApp: App {
    var body: some Scene {
        WindowGroup {
            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    Image(nsImage: MapCellGraphics.create(backgroundColor: .purple.withAlphaComponent(0.2), systemName: "mountain.2.fill", color: .white)!)
                    Image(nsImage: MapCellGraphics.create(backgroundColor: .purple.withAlphaComponent(0.2), systemName: "mountain.2.fill", color: .white)!)
                    Image(nsImage: MapCellGraphics.create(backgroundColor: .purple.withAlphaComponent(0.2), systemName: "mountain.2.fill", color: .white)!)
                    Image(nsImage: MapCellGraphics.create(backgroundColor: .purple.withAlphaComponent(0.2), systemName: "mountain.2.fill", color: .white)!)
                }
                VStack(spacing: 0) {
                    Image(nsImage: MapCellGraphics.create(backgroundColor: .purple.withAlphaComponent(0.2), systemName: "mountain.2.fill", color: .white)!)
                    Image(nsImage: MapCellGraphics.create(backgroundColor: .purple.withAlphaComponent(0.2), systemName: "mountain.2.fill", color: .white)!)
                    Image(nsImage: MapCellGraphics.create(backgroundColor: .purple.withAlphaComponent(0.2), systemName: "mountain.2.fill", color: .white)!)
                    Image(nsImage: MapCellGraphics.create(backgroundColor: .purple.withAlphaComponent(0.2), systemName: "mountain.2.fill", color: .white)!)
                }
                VStack(spacing: 0) {
                    Image(nsImage: MapCellGraphics.create(backgroundColor: .purple.withAlphaComponent(0.2), systemName: "mountain.2.fill", color: .white)!)
                    Image(nsImage: MapCellGraphics.create(backgroundColor: .purple.withAlphaComponent(0.2), systemName: "mountain.2.fill", color: .white)!)
                    Image(nsImage: MapCellGraphics.create(backgroundColor: .purple.withAlphaComponent(0.2), systemName: "mountain.2.fill", color: .white)!)
                    Image(nsImage: MapCellGraphics.create(backgroundColor: .purple.withAlphaComponent(0.2), systemName: "mountain.2.fill", color: .white)!)
                }
            }
        }
    }
}

struct Glow: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            content.blur(radius: 5)
            content
        }
    }
}

extension View {
    func glow() -> some View {
        self.modifier(Glow())
    }
}

struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 1, y: 1))
        path.addLine(to: CGPoint(x: 100, y: 100))
        return path
    }
}
