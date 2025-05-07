//
//  KeyboardAvoiding.swift
//  ImaginAIry
//
//  Created by Abilash Balasubramanian on 19/01/25.
//
import SwiftUI

// MARK: - Keyboard Avoidance Modifier
extension View {
    public func keyboardAvoiding() -> some View {
        self.modifier(KeyboardAvoiding())
    }
}

// MARK: - Keyboard Avoidance Logic
public struct KeyboardAvoiding: ViewModifier {
    @State private var keyboardHeight: CGFloat = 0

    public func body(content: Content) -> some View {
        content
            .padding(.bottom, keyboardHeight)
            .onAppear {
            }
    }
}
