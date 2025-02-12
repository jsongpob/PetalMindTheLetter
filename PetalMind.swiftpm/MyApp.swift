import SwiftUI

@main
struct MyApp: App {
    
    @StateObject private var pageViewModel = PageViewModel()
    @StateObject private var storyModel = StoryModel()
    @StateObject private var interactiveModel = InteractiveModel()
    @StateObject private var guideViewContentModel = GuideViewContentModel()
    @StateObject private var photoModel = PhotoModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pageViewModel)
                .environmentObject(storyModel)
                .environmentObject(interactiveModel)
                .environmentObject(guideViewContentModel)
                .environmentObject(photoModel)
        }
    }
}
