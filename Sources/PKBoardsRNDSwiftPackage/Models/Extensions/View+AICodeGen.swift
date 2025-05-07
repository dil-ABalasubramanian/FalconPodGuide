//
//  View+ImaginAIry.swift
//  ImaginAIry
//
//  Created by Abilash Balasubramanian on 28/01/25.
//

import SwiftUI

extension View {
    // MARK: - Floating Animated Shapes
    public func floatingShapes(animateShapes: Bool) -> some View {
        ZStack {
            Circle()
                .fill(Color.blue.opacity(0.5))
                .frame(width: 180, height: 180)
                .offset(x: animateShapes ? -120 : 120, y: animateShapes ? -250 : -200)
                .blur(radius: 15)
                .animation(Animation.easeInOut(duration: 3).repeatForever(), value: animateShapes)

            Circle()
                .fill(Color.red.opacity(0.4))
                .frame(width: 140, height: 140)
                .offset(x: animateShapes ? 150 : -100, y: animateShapes ? 250 : 150)
                .blur(radius: 10)
                .animation(Animation.easeInOut(duration: 2.5).repeatForever(), value: animateShapes)
        }
    }
}
