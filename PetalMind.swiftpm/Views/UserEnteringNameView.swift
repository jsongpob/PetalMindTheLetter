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
                                    Text("Receive")
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
                Text("Please enter your name...")
                    .font(.custom("ShantellSans-SemiBold", size: 22))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
                TextField("Enter...", text: $userModel.nameOfUser)
                    .font(.custom("ShantellSans-SemiBold", size: 48))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct UserReceiveView: View {
    @EnvironmentObject var pageViewModel: PageViewModel
    @EnvironmentObject var photoModel: PhotoModel
    @State var isReceiving: Bool = true
    
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
                    Text("Receiving letters...")
                        .font(.custom("ShantellSans-SemiBold", size: 22))
                        .foregroundColor(Color(hex: 0x483528))
                        .multilineTextAlignment(.center)
                }
            } else {
                Group {
                    VStack {
                        Spacer()
                        VStack {
                            Text("This letter was sent to you by \nthe sender... from the future")
                                .font(.custom("ShantellSans-SemiBold", size: 18))
                                .foregroundColor(Color(hex: 0x483528))
                                .multilineTextAlignment(.center)
                            Image("")
                        }
                        Spacer()
                        Text("Tap the letter to open!")
                            .font(.custom("ShantellSans-ExtraBold", size: 18))
                            .foregroundColor(Color(hex: 0x483528))
                            .multilineTextAlignment(.center)
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
}

#Preview {
    UserReceiveView()
        .environmentObject(UserModel())
        .environmentObject(PageViewModel())
        .environmentObject(PhotoModel())
}
