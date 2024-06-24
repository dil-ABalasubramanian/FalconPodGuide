
import Foundation

public class Home {
    public static let shared =  Home()
    private let canShowHome = true
    public func canShowHomeScreen() -> Bool{
        return canShowHome
    }
}
