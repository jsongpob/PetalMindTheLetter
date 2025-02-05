import SwiftUI

@main
struct MyApp: App {
    
    @StateObject private var pageViewModel = PageViewModel()
    @StateObject private var storyModel = StoryModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pageViewModel)
                .environmentObject(storyModel)
        }
    }
}
