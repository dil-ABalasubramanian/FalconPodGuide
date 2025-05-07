//
//  CodeLanguage.swift
//  AI Code Gen
//
//  Created by Abilash Balasubramanian on 09/02/25.
//
import SwiftUI

enum CodeLanguage: String, CaseIterable, Identifiable {
    case swiftUI = "SwiftUI"
    case objc = "Objective-C"
    case uikit = "UIKit"

    var id: String { self.rawValue }
}
