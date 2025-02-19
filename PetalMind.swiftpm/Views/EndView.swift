//
//  EndView.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 17/2/2568 BE.
//

import SwiftUI

struct EndView: View {
    @EnvironmentObject var pageViewModel: PageViewModel
    @EnvironmentObject var userModel: UserModel
    @EnvironmentObject var photoModel: PhotoModel
    @EnvironmentObject var interactiveModel: InteractiveModel
    @EnvironmentObject var storyModel: StoryModel
    @EnvironmentObject var guideViewContentModel: GuideViewContentModel
    @EnvironmentObject var resultViewModelContent: ResultViewModelContent
    @EnvironmentObject var stressManager: StressManager
    @StateObject var dayManager = DayManager()
    @StateObject var brainManager = BrainManager()
    
    @State var onThanks: Bool = false
    
    var body: some View {
        ZStack {
            Image("letterPaperTexture")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0)
                .edgesIgnoringSafeArea(.all)
                .opacity(1.0)
            
            VStack(spacing: 20) {
                
                Spacer()
                
                if (onThanks) {
                    if let image = photoModel.image {
                        ThankYouView(image: image)
                    } else {
                        PlaceholderThankYouView()
                    }
                } else {
                    AwarenessView()
                }
                
                Spacer()
                
                VStack(spacing: 0) {
                    
                    if (!onThanks) {
                        Button {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                pageViewModel.nextToSummary()
                            }
                        } label: {
                            Text("back to open other letters left")
                                .font(.custom("ShantellSans-ExtraBold", size: 16))
                                .foregroundColor(Color(hex: 0x483528))
                                .multilineTextAlignment(.center)
                                .underline()
                        }
                    }
                    
                    Button {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            if (onThanks) {
                                ResetTheLetter()
                                pageViewModel.displayLetter = false
                            } else {
                                onThanks = true
                            }
                        }
                    } label: {
                        ZStack {
                            Image("MainButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, alignment: .center)
                            Text(onThanks ? "End" : "Continue")
                                .font(.custom("ShantellSans-Extrabold", size: 22))
                                .foregroundColor(Color(hex: 0x483528))
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }
            .multilineTextAlignment(.center)
        }
    }
    
    private func ResetTheLetter() {
        pageViewModel.resetValue()
        resetAllToDefault()
    }
    
    private func resetAllToDefault() {
        pageViewModel.displayLetter = false
        pageViewModel.resetValue()
        userModel.nameOfUser = ""
        photoModel.image = nil
        storyModel.currentIndexStory = 0
        storyModel.currentIndexStory = 0
        stressManager.stressLevel = 50.0
        dayManager.currentDay = 1
        dayManager.isDayOver = false
        guideViewContentModel.currentPage = 0
        resultViewModelContent.currentPage = 0
    }
}

struct AwarenessView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Therefore, mental health issues \nare no longer something \ndistant or unrelated to us")
                .font(.custom("ShantellSans-Bold", size: 20))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            Text("But it is an important issue that should be \naddressed and helped with seriously")
                .font(.custom("ShantellSans-Medium", size: 16))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            
            Divider()
                .frame(minHeight: 0.5)
                .background(Color(hex: 0x483528))
                .padding(.horizontal, 80)
                .padding(.vertical, 20)
            
            Text("Otherwise, the person in \nthe letter could be your family, \nyour friends, or even yourself")
                .font(.custom("ShantellSans-ExtraBold", size: 18))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
        }
    }
}

struct ThankYouView: View {
    let image: UIImage
    
    var body: some View {
        VStack(spacing: 30) {
            HStack(spacing: 10) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                Text("😊")
                    .font(.system(size: 55))
            }
            
            Text("Thank you for playing!")
                .font(.custom("ShantellSans-ExtraBold", size: 24))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            Text("I hope you understand what’s happening \nand that it might help you :)")
                .font(.custom("ShantellSans-Medium", size: 18))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            
            Divider()
                .frame(minHeight: 0.5)
                .background(Color(hex: 0x483528))
                .padding(.horizontal, 80)
                .padding(.vertical, 10)
            
            Text("With best wishes \nfrom me (the creator)")
                .font(.custom("ShantellSans-ExtraBold", size: 20))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            
            Divider()
                .frame(minHeight: 0.5)
                .background(Color(hex: 0x483528))
                .padding(.horizontal, 80)
                .padding(.vertical, 10)
            
            Text("Just smile for yourself")
                .font(.custom("ShantellSans-ExtraBold", size: 26))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct PlaceholderThankYouView: View {    
    var body: some View {
        VStack(spacing: 30) {
            HStack(spacing: 10) {
                Circle()
                    .opacity(0.4)
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                Text("😊")
                    .font(.system(size: 55))
            }
            
            Text("Thank you for playing!")
                .font(.custom("ShantellSans-ExtraBold", size: 24))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            Text("I hope you understand what’s happening \nand that it might help you :)")
                .font(.custom("ShantellSans-Medium", size: 18))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            
            Divider()
                .frame(minHeight: 0.5)
                .background(Color(hex: 0x483528))
                .padding(.horizontal, 80)
                .padding(.vertical, 10)
            
            Text("With best wishes \nfrom me (the creator)")
                .font(.custom("ShantellSans-ExtraBold", size: 20))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            
            Divider()
                .frame(minHeight: 0.5)
                .background(Color(hex: 0x483528))
                .padding(.horizontal, 80)
                .padding(.vertical, 10)
            
            Text("Just smile for yourself")
                .font(.custom("ShantellSans-ExtraBold", size: 26))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    EndView()
        .environmentObject(PhotoModel())
}
