
import Foundation

public class Home {
    public static let shared =  Home()
    private let canShowHome = true
    public func canShowHomeScreen() -> Bool{
        return canShowHome
    }

    public func printMyVersion() -> String {
        guard let version = Bundle.main
            .infoDictionary?["CFBundleShortVersionString"] as? String else { return "Unknown" }
        return version
    }
}
