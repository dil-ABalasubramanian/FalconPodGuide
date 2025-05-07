// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public class PKBoardsRNDSwift {
    private var info: String

    public init(defaultInfo: String = "default-value") {
        self.info = defaultInfo
    }

    /// Updates the stored info string
    public func updateInfo(to newInfo: String) {
        self.info = newInfo
    }

    /// Retrieves the current info string
    public func getInfo() -> String {
        return info
    }
}
