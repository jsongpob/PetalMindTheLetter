//
//  EnteringStory.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 3/2/2568 BE.
//

import SwiftUI

struct EnteringStory: View {
    
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
                Text("Introduction Story")
                    .font(.title)
            }
        }
    }
}

#Preview {
    EnteringStory()
}
