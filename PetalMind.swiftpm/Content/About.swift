//
//  About.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 3/2/2568 BE.
//

import SwiftUI

struct About: View {
    
    @EnvironmentObject var pageViewModel: PageViewModel
    @State var isShowReferences: Bool = false
    
    var body: some View {
        ZStack {
            //Background
            Image("letterPaperTexture")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0)
                .edgesIgnoringSafeArea(.all)
            
            //Content
            VStack(spacing: 0) {
                VStack {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .padding(20)
                    
                    VStack(spacing: 30) {
                        Text("About this project")
                            .font(.custom("ShantellSans-ExtraBold", size: 24))
                        
                        VStack(spacing: 0) {
                            Text("This project was create by\n") +
                            Text("Songpob Hamthanan")
                                .font(.custom("ShantellSans-Bold", size: 18))
                            Text(" \nas a submission to the \nSwift Student Challenge 2025")
                        }
                        .font(.custom("ShantellSans-SemiBold", size: 16))
                        
                        Divider()
                            .frame(minHeight: 1)
                            .background(Color(hex: 0x483528))
                            .padding(.horizontal, 80)
                            .padding(.vertical, 0)
                        
                        VStack(spacing: 0) {
                            VStack(spacing: 15) {
                                Text("Font: Shantell Sans \nby www.shantellsans.com")
                                Text("Music by Anastasia Chubarova \nfrom www.Pixabay.com")
                                Text("All assets were created by me, \nillustrations drawn on Procreate \nand UI designed in Figma")
                                Text("Emojis were generated using \nGenmoji by Apple Intelligence")
                            }
                            
                            Spacer()
                            
                            Button {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    isShowReferences = true
                                }
                            } label: {
                                Text("View the referenced content")
                                    .underline()
                            }
                            .padding(.bottom, 20)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .font(.custom("ShantellSans-SemiBold", size: 14))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 15)
                }
                
                Spacer()
                
                //Buttom Button
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        pageViewModel.displayAbout.toggle()
                    }
                } label: {
                    Image("CloseIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, alignment: .center)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .overlay {
            if (isShowReferences) {
                ReferencesView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .background(.black.opacity(0.5))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isShowReferences = false
                        }
                    }
            }
        }
    }
}

struct ReferencesView: View {
    var body: some View {
        ZStack {
            Image("overlayPaper")
                .resizable()
                .scaledToFit()
            
            VStack(spacing: 40) {
                Text("Thank you for the \nreferenced content from...")
                    .font(.custom("ShantellSans-ExtraBold", size: 18))
                    .multilineTextAlignment(.center)
                
                VStack(spacing: 20) {
                    Link(destination: URL(string: "https://www.naluri.life/news-and-reports/2024-employee-mental-health-asia-report")!, label: {
                        Text("Naluri, \n2024 employee mental health \nasia report")
                            .underline()
                    })
                    Link(destination: URL(string: "https://www.weforum.org/stories/2021/03/gen-z-unemployment-chart-global-comparisons/")!, label: {
                        Text("World Economic Forum, \ngen z unemployment")
                            .underline()
                    })
                    Link(destination: URL(string: "https://spacebar.th/world/1-in-7-southeast-asia-live-with-mental-health-condition")!, label: {
                        Text("Spacebar, \n1 in 7 southeast asia live \nwith mental health")
                            .underline()
                    })
                    Link(destination: URL(string: "https://www.who.int/news-room/fact-sheets/detail/mental-health-strengthening-our-response")!, label: {
                        Text("World Health Organization, \nMental health")
                            .underline()
                    })
                    Link(destination: URL(string: "https://discoverymood.com/blog/cost-of-mental-health-increase")!, label: {
                        Text("Discovery Mood, \nThe Rising Cost of Mental Health \nand Substance Abuse in \nthe United States")
                            .underline()
                    })
                }
                .multilineTextAlignment(.leading)
                .underline()
                
                Text("Tap to close")
                    .font(.custom("ShantellSans-ExtraBold", size: 16))
                    .foregroundColor(Color(hex: 0x483528))
            }
            .font(.custom("ShantellSans-Medium", size: 16))
            .foregroundColor(Color(hex: 0x483528))
        }
    }
}

#Preview {
    About()
        .environmentObject(PageViewModel())
}
