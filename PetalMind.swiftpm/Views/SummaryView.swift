//
//  SummaryView.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 16/2/2568 BE.
//

import SwiftUI

struct SummaryView: View {
    @EnvironmentObject var pageViewModel: PageViewModel
    @State private var selectedLetter: SelectedLetter = .none
    @State var isDisplay: Bool = false
    
    var body: some View {
        ZStack {
            Image("letterPaperTexture")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0)
                .edgesIgnoringSafeArea(.all)
                .opacity(1.0)
            
            VStack {
                Text("You still have letters left \nTry selecting one")
                    .font(.custom("ShantellSans-Bold", size: 16))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
                
                VStack(spacing: 0) {
                    Button {
                        selectedLetter = .letter1
                        withAnimation(.easeInOut(duration: 0.25)) {
                            isDisplay = true
                        }
                    } label: {
                        ZStack {
                            Image("theMailLetter")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180, alignment: .center)
                        }
                    }
                    
                    Button {
                        selectedLetter = .letter2
                        withAnimation(.easeInOut(duration: 0.25)) {
                            isDisplay = true
                        }
                    } label: {
                        ZStack {
                            Image("theMailLetter")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180, alignment: .center)
                        }
                    }
                    
                    Button {
                        selectedLetter = .letter3
                        withAnimation(.easeInOut(duration: 0.25)) {
                            isDisplay = true
                        }
                    } label: {
                        ZStack {
                            Image("theMailLetter")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180, alignment: .center)
                        }
                    }
                }
                
                VStack(spacing: 0) {
                    Text("or")
                        .font(.custom("ShantellSans-ExtraBold", size: 16))
                        .foregroundColor(Color(hex: 0x483528))
                        .multilineTextAlignment(.center)
                    Button {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            pageViewModel.nextToEnd()
                        }
                    } label: {
                        ZStack {
                            Image("MainButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, alignment: .center)
                            Text("Continue")
                                .font(.custom("ShantellSans-Extrabold", size: 22))
                                .foregroundColor(Color(hex: 0x483528))
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }
        }
        .overlay {
            if (isDisplay) {
                LetterFactView(selectedLetter: selectedLetter)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .background(.black.opacity(0.5))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            isDisplay = false
                        }
                    }
            }
        }
    }
}

enum SelectedLetter {
    case none
    case letter1
    case letter2
    case letter3
}

struct LetterFactView: View {
    let selectedLetter: SelectedLetter
    
    var body: some View {
        ZStack {
            Image("letterOfHelped")
                .resizable()
                .scaledToFit()
            
            VStack(spacing: 0) {
                
                switch selectedLetter {
                case .letter1:
                    LetterFact1()
                case .letter2:
                    LetterFact2()
                case .letter3:
                    LetterFact3()
                default:
                    LetterFact1()
                }
            }
        }
    }
}

struct LetterFact1: View {
    var body: some View {
        VStack(spacing: 15) {
            
            Text("Did you know that right now")
                .font(.custom("ShantellSans-ExtraBold", size: 16))
                .foregroundColor(Color(hex: 0x483528))
            
            VStack(spacing: 0) {
                Text("Gen Z in Asia \n(born between 1997 and 2012), \nmaking up around")
                    .font(.custom("ShantellSans-Medium", size: 16))
                    .foregroundColor(Color(hex: 0x483528)) +
                Text(" 30% of \nthe global workforce, ")
                    .font(.custom("ShantellSans-Bold", size: 16))
                    .foregroundColor(Color(hex: 0x483528)) +
                Text("are facing \nmental health risks")
                    .font(.custom("ShantellSans-Medium", size: 16))
                    .foregroundColor(Color(hex: 0x483528))
            }
            .multilineTextAlignment(.center)
            
            Divider()
                .frame(minHeight: 0.5)
                .background(Color(hex: 0x483528))
                .padding(.horizontal, 80)
                .padding(.vertical, 20)
            
            VStack(spacing: 5) {
                Text("Among them,")
                    .font(.custom("ShantellSans-Medium", size: 16))
                    .foregroundColor(Color(hex: 0x483528))
                Text("6 out of 10")
                    .font(.custom("ShantellSans-Bold", size: 36))
                    .foregroundColor(Color(hex: 0xF28F46))
                Text("are at risk of mental health issues")
                    .font(.custom("ShantellSans-Medium", size: 16))
                    .foregroundColor(Color(hex: 0x483528))
            }
            .padding(.bottom, 20)
            
            Text("Tap to continue")
                .font(.custom("ShantellSans-ExtraBold", size: 16))
                .foregroundColor(Color(hex: 0x483528))
        }
    }
}

struct LetterFact2: View {
    var body: some View {
        VStack(spacing: 15) {
            
            Text("Did you know that right now")
                .font(.custom("ShantellSans-ExtraBold", size: 16))
                .foregroundColor(Color(hex: 0x483528))
            
            VStack(spacing: 0) {
                Text("Work burnout among Gen Z could \nlead to massive damage in the future \n")
                    .font(.custom("ShantellSans-Bold", size: 16))
                    .foregroundColor(Color(hex: 0x483528)) +
                Text(" The impact of mental health \nissues is expected to result in...")
                    .font(.custom("ShantellSans-Medium", size: 16))
                    .foregroundColor(Color(hex: 0x483528))
            }
            .multilineTextAlignment(.center)
            
            Divider()
                .frame(minHeight: 0.5)
                .background(Color(hex: 0x483528))
                .padding(.horizontal, 80)
                .padding(.vertical, 20)
            
            VStack(spacing: 5) {
                Text("an economic loss of up to")
                    .font(.custom("ShantellSans-Medium", size: 16))
                    .foregroundColor(Color(hex: 0x483528))
                Text("6 trillion")
                    .font(.custom("ShantellSans-Bold", size: 36))
                    .foregroundColor(Color(hex: 0xF28F46))
                Text("USD by 2030")
                    .font(.custom("ShantellSans-Medium", size: 16))
                    .foregroundColor(Color(hex: 0x483528))
            }
            .padding(.bottom, 20)
            
            Text("Tap to continue")
                .font(.custom("ShantellSans-ExtraBold", size: 16))
                .foregroundColor(Color(hex: 0x483528))
        }
    }
}

struct LetterFact3: View {
    var body: some View {
        VStack(spacing: 15) {
            
            Text("Did you know that right now")
                .font(.custom("ShantellSans-ExtraBold", size: 16))
                .foregroundColor(Color(hex: 0x483528))
            
            VStack(spacing: 0) {
                Text("The World Health Organization (WHO) \nhas revealed that \napproximately")
                    .font(.custom("ShantellSans-Medium", size: 16))
                    .foregroundColor(Color(hex: 0x483528)) +
                Text(" 260 million people")
                    .font(.custom("ShantellSans-Bold", size: 16))
                    .foregroundColor(Color(hex: 0x483528)) +
                Text("\nin Southeast Asia or about...")
                    .font(.custom("ShantellSans-Medium", size: 16))
                    .foregroundColor(Color(hex: 0x483528))
            }
            .multilineTextAlignment(.center)
            
            Divider()
                .frame(minHeight: 0.5)
                .background(Color(hex: 0x483528))
                .padding(.horizontal, 80)
                .padding(.vertical, 20)
            
            VStack(spacing: 5) {
                Text("1 in 7")
                    .font(.custom("ShantellSans-Bold", size: 36))
                    .foregroundColor(Color(hex: 0xF28F46))
                Text("experience mental health conditions \nand many do not receive timely \ntreatment")
                    .font(.custom("ShantellSans-Medium", size: 16))
                    .foregroundColor(Color(hex: 0x483528))
            }
            .multilineTextAlignment(.center)
            .padding(.bottom, 20)
            
            Text("Tap to continue")
                .font(.custom("ShantellSans-ExtraBold", size: 16))
                .foregroundColor(Color(hex: 0x483528))
        }
    }
}

#Preview {
    LetterFactView(selectedLetter: .letter3)
}
