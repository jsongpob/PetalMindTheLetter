//
//  PageViewModel.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 3/2/2568 BE.
//

import Foundation
import SwiftUI

class PageViewModel: ObservableObject {
    @Published var displayAbout: Bool = false
    @Published var displayLetter: Bool = false
    
    @Published var introductionIsEnd: Bool = false
    @Published var interactiveIsEnd: Bool = false
    @Published var conclusionIsEnd: Bool = false
    
    @Published var onIntroduction: Bool = false
    @Published var onInteractive: Bool = false
    @Published var onConclusion: Bool = false
    
    @Published var onSelectionResult: Bool = false
    @Published var behaviorIsPositive: Bool = false
    
    @Published var onInteractiveGuide: Bool = false
    
    func nextToConclusion() {
        onIntroduction = false
        onInteractive = false
        onConclusion = true
    }
    
    func nextToInteractive() {
        onIntroduction = false
        onInteractive = true
        onConclusion = false
    }
    
    func nextToIntroduction() {
        displayLetter = true
        onIntroduction = true
        onInteractive = false
        onConclusion = false
    }
    
    func showSelectionResult(for behavior: Behavior) {
        if behavior.increase {
            behaviorIsPositive = false
        } else {
            behaviorIsPositive = true
        }
        
        withAnimation(.easeInOut(duration: 0.5)) {
            onSelectionResult = true
        }
    }
}
