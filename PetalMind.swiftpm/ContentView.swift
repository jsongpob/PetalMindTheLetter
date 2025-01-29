import SwiftUI

struct ContentView: View {
    @State private var orientation = UIDevice.current.orientation

    var body: some View {
        VStack(spacing: 0) {
            if orientation.isLandscape {
                Text("Hello!, This is PetalMind.")
            } else {
                notSupportedOrientation
            }
        }
        .ignoresSafeArea(edges: .all)
        .detectOrientation($orientation)
    }

    var notSupportedOrientation: some View {
        ZStack {
            Image("letterPaperTexture")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 40) {
                Image("deviceRotationIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 256.0, height: 256.0)
                Text("Please hold your iPad in Landscape orientation")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(Color(hex: 0x483528))
            }
        }
    }
}
