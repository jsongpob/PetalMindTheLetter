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
        if (pageViewModel.introductionIsEnd) {
            InteractiveLetter()
                .transition(.opacity)
        } else {
            EnteringStory()
        }
    }
    
    @Environment(\.dismiss) var dismiss
}
