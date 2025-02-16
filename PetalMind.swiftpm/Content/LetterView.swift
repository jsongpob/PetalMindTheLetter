//
//  LetterView.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 3/2/2568 BE.
//

import SwiftUI

struct LetterView: View {
    
    @EnvironmentObject var pageViewModel: PageViewModel
    
    var body: some View {
        if (pageViewModel.onInteractive) {
            InteractiveLetter()
                .transition(.opacity)
        } else if (pageViewModel.onReceive) {
            ReceiveView()
        } else if (pageViewModel.onEnterName) {
            UserEnteringNameView()
        } else if (pageViewModel.onIntroduction) {
            EnteringStory()
        } else if (pageViewModel.onTypeOfHelp) {
            TypeOfHelpView()
        }
        else {
            Text("Conclusion")
        }
    }
    
    @Environment(\.dismiss) var dismiss
}
