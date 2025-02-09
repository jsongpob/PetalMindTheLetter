import SwiftUI

struct Home: View {
    
    let fontManager = CustomFonts()
    
    //Initialize load fonts
    init() {
        fontManager.registerFontIfNeeded(fontName: "ShantellSans-SemiBold", fileName: "ShantellSans-SemiBold")
        fontManager.registerFontIfNeeded(fontName: "ShantellSans-ExtraBold", fileName: "ShantellSans-ExtraBold")
        fontManager.registerFontIfNeeded(fontName: "ShantellSans-Bold", fileName: "ShantellSans-Bold")
        fontManager.registerFontIfNeeded(fontName: "ShantellSans-Medium", fileName: "ShantellSans-Medium")
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
                            pageViewModel.nextToIntroduction()
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
                        withAnimation(.easeInOut(duration: 0.5)) {
                            pageViewModel.displayAbout.toggle()
                        }
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
