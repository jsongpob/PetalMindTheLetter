import SwiftUI

struct Home: View {
    
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
                            .font(.system(size: 18, weight: .semibold, design: .rounded))
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
                                HStack(spacing: 5) {
                                    Image("MailIcon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 55, height: 50, alignment: .center)
                                    Text("Receive")
                                        .font(.system(size: 32, weight: .black, design: .rounded))
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
                    .padding(.top, 200)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}
