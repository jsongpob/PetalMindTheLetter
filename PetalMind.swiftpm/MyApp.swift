import SwiftUI

@main
struct MyApp: App {
    
    @StateObject private var pageViewModel = PageViewModel()
    @StateObject private var storyModel = StoryModel()
    @StateObject private var interactiveModel = InteractiveModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pageViewModel)
                .environmentObject(storyModel)
                .environmentObject(interactiveModel)
        }
    }
}
