//
//  About.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 3/2/2568 BE.
//

import SwiftUI

struct About: View {
    
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
            VStack(spacing: 0) {
                VStack {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .padding(20)
                        .padding(.bottom, 50)
                    Group {
                        Text("This project was create by Songpob Hamthanan \nas a submission to the \nSwift Student Challenge 2025")
                    }
                    .font(.custom("ShantellSans-SemiBold", size: 16))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
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
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
    }
}
