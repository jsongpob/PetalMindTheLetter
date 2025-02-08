import SwiftUI

struct Home: View {
    
    //Initialize load fonts
    init() {
        if let fontURL = Bundle.main.url(forResource: "ShantellSans-SemiBold", withExtension: "ttf"),
           let fontData = try? Data(contentsOf: fontURL) as CFData,
           let provider = CGDataProvider(data: fontData),
           let font = CGFont(provider) { CTFontManagerRegisterGraphicsFont(font, nil)}
        else {
            print("Failed to register custom font 'titleFont'.")
        }
        
        if let exboldfontURL = Bundle.main.url(forResource: "ShantellSans-ExtraBold", withExtension: "ttf"),
           let exboldfontData = try? Data(contentsOf: exboldfontURL) as CFData,
           let exboldprovider = CGDataProvider(data: exboldfontData),
           let exboldfont = CGFont(exboldprovider) { CTFontManagerRegisterGraphicsFont(exboldfont, nil)}
        else {
            print("Failed to register custom font 'ExtraboldFont'.")
        }
    }
    
    @EnvironmentObject var pageViewModel: PageViewModel
    
    var body: some View {
        ZStack {
            
            //Background
            Image("letterPaperTexture")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0)
                .edgesIgnoringSafeArea(.all)
            
            //Content
            if (pageViewModel.displayAbout) {
                About()
            } else {
                VStack(spacing: 0) {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .padding(20)
                        .padding(.bottom, 100)
                    
                    VStack(spacing: 0) {
                        Text("You got a new letter, open it!")
                            .font(.custom("ShantellSans-SemiBold", size: 20))
                            .foregroundColor(Color(hex: 0x483528))
                            .multilineTextAlignment(.center)
                        Button {
                            pageViewModel.displayLetter = true
                        } label: {
                            ZStack {
                                Image("MainButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 260, alignment: .center)
                                HStack(spacing: 10) {
                                    Image("MailIcon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 55, height: 50, alignment: .center)
                                    Text("Receive")
                                        .font(.custom("ShantellSans-ExtraBold", size: 28))
                                        .foregroundColor(Color(hex: 0x483528))
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                        .fullScreenCover(isPresented: $pageViewModel.displayLetter) {
                            LetterView()
                        }
                    }
                    //Buttom Button
                    Button {
                        pageViewModel.displayAbout.toggle()
                    } label: {
                        Image("QuestionIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 48, alignment: .center)
                    }
                    .buttonStyle(.plain)
                    .padding(.top, 200)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}
