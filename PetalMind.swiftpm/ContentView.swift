import SwiftUI

struct ContentView: View {
    
    @State private var orientation = UIDevice.current.orientation
    
    var body: some View {
        Home()
    }

    var notSupportedOrientation: some View {
        ZStack {
            Image("letterPaperTexture")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                Text("Please hold your iPhone in Protrait orientation")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
            }
        }
    }
}
