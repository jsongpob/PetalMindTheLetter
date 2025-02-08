//
//  EnteringStory.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 3/2/2568 BE.
//

import SwiftUI

struct EnteringStory: View {
    
    //Initialize load fonts
    init() {
        if let fontURL = Bundle.main.url(forResource: "ShantellSans-SemiBold", withExtension: "ttf"),
           let fontData = try? Data(contentsOf: fontURL) as CFData,
           let provider = CGDataProvider(data: fontData),
           let font = CGFont(provider) { CTFontManagerRegisterGraphicsFont(font, nil)}
        else {
            print("Failed to register custom font 'SemiBoldFont'.")
        }
        
        if let exboldfontURL = Bundle.main.url(forResource: "ShantellSans-ExtraBold", withExtension: "ttf"),
           let exboldfontData = try? Data(contentsOf: exboldfontURL) as CFData,
           let exboldprovider = CGDataProvider(data: exboldfontData),
           let exboldfont = CGFont(exboldprovider) { CTFontManagerRegisterGraphicsFont(exboldfont, nil)}
        else {
            print("Failed to register custom font 'ExtraboldFont'.")
        }
        
        if let mediumfontURL = Bundle.main.url(forResource: "ShantellSans-Medium", withExtension: "ttf"),
           let mediumfontData = try? Data(contentsOf: mediumfontURL) as CFData,
           let mediumprovider = CGDataProvider(data: mediumfontData),
           let mediumfont = CGFont(mediumprovider) { CTFontManagerRegisterGraphicsFont(mediumfont, nil)}
        else {
            print("Failed to register custom font 'MediumFont'.")
        }
    }

    @EnvironmentObject var pageViewModel: PageViewModel
    @EnvironmentObject var storyModel: StoryModel
    
    @State private var showOpeningLetter: Bool = true
    @State private var showInteractiveLetter: Bool = false

    var body: some View {
        ZStack {
            //Background
            Image("letterPaperTexture")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0)
                .edgesIgnoringSafeArea(.all)

            ZStack {
                if (showOpeningLetter) {
                    OpeningLetterView()
                } else {
                    LetterIntro()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        showOpeningLetter = false
                    }
                }
            }

            if (!showOpeningLetter && !showInteractiveLetter) {
                VStack {
                    Button {
                        if ( storyModel.currentIndexStory < storyData.count - 1) {
                            storyModel.currentIndexStory += 1
                        } else {
                            withAnimation {
                                pageViewModel.introductionIsEnd = true
                            }
                        }
                    } label: {
                        ZStack {
                            Image("MainButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 290, alignment: .center)
                            HStack(spacing: 5) {
                                Text(storyData[storyModel.currentIndexStory].buttontitle)
                                    .font(.custom("ShantellSans-Extrabold", size: 22))
                                    .foregroundColor(Color(hex: 0x483528))
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                    .buttonStyle(.plain)
                }
                .frame(
                    maxWidth: .infinity, maxHeight: .infinity,
                    alignment: .bottom
                )
                .padding(.bottom, 40)
            }
        }
    }
}

struct OpeningLetterView: View {
    var body: some View {
        VStack {
            Image("MailIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, alignment: .center)
            Text("Opening the letter...")
                .font(.custom("ShantellSans-SemiBold", size: 20))
                .foregroundColor(Color(hex: 0x483528))
        }
    }
}

struct LetterIntro: View {
    
    @EnvironmentObject var storyModel: StoryModel
    
    var body: some View {
            VStack {
                Image(storyData[storyModel.currentIndexStory].imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, alignment: .center)
                Text(storyData[storyModel.currentIndexStory].text)
                    .font(.custom("ShantellSans-Medium", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(hex: 0x483528))
                    .padding(.horizontal, 48)
            }
    }
}

#Preview {
    EnteringStory()
}
