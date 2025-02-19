//
//  UserView.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 12/2/2568 BE.
//
import SwiftUI

struct UserEnteringNameView: View {
    
    @EnvironmentObject var userModel: UserModel
    @EnvironmentObject var pageViewModel: PageViewModel
    
    var body: some View {
        ZStack {
            //Background
            Image("letterPaperTexture")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                if (!pageViewModel.onUserReceived) {
                    EnteringNameView()
                } else {
                    UserReceiveView()
                }
                
                if (!pageViewModel.onUserReceived) {
                    VStack {
                        Button {
                            if (userModel.nameOfUser.isEmpty == false) {
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    pageViewModel.onUserReceived = true
                                }
                            }
                        } label: {
                            ZStack {
                                Image("MainButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 290, alignment: .center)
                                HStack(spacing: 5) {
                                    Text("Next")
                                        .font(.custom("ShantellSans-Extrabold", size: 22))
                                        .foregroundColor(Color(hex: 0x483528))
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                        .buttonStyle(.plain)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .padding(.bottom, 40)
                }
            }
        }
    }
}

struct EnteringNameView: View {
    @EnvironmentObject var userModel: UserModel
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Spacer()
                Text("Please enter your nickname...")
                    .font(.custom("ShantellSans-SemiBold", size: 22))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
                TextField("Enter...", text: $userModel.nameOfUser)
                    .font(.custom("ShantellSans-SemiBold", size: 48))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
                    .autocorrectionDisabled()
            }
        }
    }
}

struct UserReceiveView: View {
    @EnvironmentObject var pageViewModel: PageViewModel
    @EnvironmentObject var photoModel: PhotoModel
    @EnvironmentObject var userModel: UserModel
    @State var isReceiving: Bool = true
    @State var scaleSizeMail: CGFloat = 0.8
    
    var body: some View {
        VStack {
            if (isReceiving) {
                VStack(spacing: 20) {
                    if let image = photoModel.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 180, height: 180)
                    }
                    VStack(spacing: 5) {
                        Text("from someone to \(userModel.nameOfUser)")
                            .font(.custom("ShantellSans-SemiBold", size: 24))
                            .foregroundColor(Color(hex: 0x483528))
                            .multilineTextAlignment(.center)
                        
                        Text("Receiving letters...")
                            .font(.custom("ShantellSans-SemiBold", size: 16))
                            .foregroundColor(Color(hex: 0x483528))
                            .multilineTextAlignment(.center)
                    }
                }
            } else {
                Group {
                    VStack {
                        Spacer()
                        VStack {
                            VStack(spacing: 0) {
                                VStack(spacing: 10) {
                                    Text("This letter was sent to you by \nthe sender... from the ")
                                        .font(.custom("ShantellSans-SemiBold", size: 18))
                                        .foregroundColor(Color(hex: 0x483528)) +
                                    Text("future")
                                        .font(.custom("ShantellSans-ExtraBold", size: 18))
                                        .foregroundColor(Color(hex: 0x483528))
                                    Text("(10 years from now)")
                                        .font(.custom("ShantellSans-Medium", size: 16))
                                        .foregroundColor(Color(hex: 0x483528))
                                }
                                
                                    ZStack {
                                        Image("theMailLetter")
                                            .resizable()
                                            .scaledToFit()
                                        VStack(spacing: 65) {
                                            HStack {
                                                Text("To... \(userModel.nameOfUser)")
                                                    .font(.custom("ShantellSans-SemiBold", size: 22))
                                                    .foregroundColor(Color(hex: 0x483528))
                                                    .multilineTextAlignment(.leading)
                                            }
                                            .frame(maxWidth: .infinity, alignment: .topLeading)
                                            .padding(.leading, 40)
                                            .padding(.top, 10)
                                            
                                            HStack {
                                                Text(userModel.futureDate.formatted(date: .long, time: .omitted))
                                                    .font(.custom("ShantellSans-SemiBold", size: 18))
                                                    .foregroundColor(Color(hex: 0x483528))
                                                    .multilineTextAlignment(.trailing)
                                                    .frame(maxWidth: 120)
                                            }
                                            .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                                            .padding(.trailing, 40)
                                        }
                                    }
                                    .scaleEffect(scaleSizeMail)
                                    .frame(width: 350)
                            }
                            .multilineTextAlignment(.center)
                            .onAppear {
                                Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                        changeScaleLetter()
                                    }
                                }
                            }
                        }
                        Spacer()
                        Text("Tap the letter to open!")
                            .font(.custom("ShantellSans-ExtraBold", size: 18))
                            .foregroundColor(Color(hex: 0x483528))
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 30)
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    isReceiving = false
                }
            }
        }
        .onTapGesture {
            if (pageViewModel.onUserReceived && !isReceiving) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    pageViewModel.nextToIntroduction()
                }
            }
        }
    }
    
    private func changeScaleLetter() {
        withAnimation(.spring(duration: 1.0)) {
            scaleSizeMail = scaleSizeMail == 0.8 ? 0.9 : 0.8
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            withAnimation(.spring(duration: 1.0)) {
                scaleSizeMail = scaleSizeMail == 0.8 ? 0.9 : 0.8
            }
        }
    }
}

#Preview {
    UserReceiveView()
        .environmentObject(UserModel())
        .environmentObject(PageViewModel())
        .environmentObject(PhotoModel())
}
