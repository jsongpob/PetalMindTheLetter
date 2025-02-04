import SwiftUI

@main
struct MyApp: App {
    
    @StateObject private var pageViewModel = PageViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pageViewModel)
        }
    }
}
