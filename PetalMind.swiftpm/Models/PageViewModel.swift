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
    @Published var onReceive: Bool = false
    @Published var onEnterName: Bool = false
    @Published var onUserReceived: Bool = false
    @Published var onInteractive: Bool = false
    @Published var onConclusion: Bool = false
    @Published var onResulted: Bool = false
    @Published var onTypeOfHelp: Bool = false
    @Published var onSummary: Bool = false
    @Published var onEnd: Bool = false
    
    @Published var onSelectionResult: Bool = false
    @Published var behaviorIsPositive: Bool = false
    
    @Published var onInteractiveGuide: Bool = false
    
    @Published var isPetalPositive: Bool = false
    @Published var showPetalParticle: Bool = false
    
    func nextToConclusion() {
        onIntroduction = false
        onInteractive = false
        onConclusion = true
        onReceive = false
    }
    
    func nextToReceiveLetter() {
        displayLetter = true
        onIntroduction = false
        onInteractive = false
        onConclusion = false
        onReceive = true
    }
    
    func nextToEnterName() {
        onIntroduction = false
        onInteractive = false
        onConclusion = false
        onReceive = false
        onEnterName = true
    }
    
    func nextToInteractive() {
        onIntroduction = false
        onInteractive = true
        onConclusion = false
        onReceive = false
        onEnterName = false
        onUserReceived = false
    }
    
    func nextToIntroduction() {
        onReceive = false
        onIntroduction = true
        onInteractive = false
        onConclusion = false
        onEnterName = false
        onUserReceived = false
    }
    
    func nextToTypeOfHelp() {
        onTypeOfHelp = true
        onInteractive = false
    }
    
    func nextToSummary() {
        onSummary = true
        onTypeOfHelp = false
        onEnd = false
    }
    
    func nextToEnd() {
        onSummary = false
        onEnd = true
    }
    
    func showSelectionResult(for behavior: Behavior) {
        if behavior.increase {
            behaviorIsPositive = false
            isPetalPositive = false
        } else {
            behaviorIsPositive = true
            isPetalPositive = true
        }
        
        showPetalParticle = true
        
        withAnimation(.easeInOut(duration: 0.5)) {
            onSelectionResult = true
        }
    }
    
    func resetValue() {
        displayAbout = false
        displayLetter = false
        
        introductionIsEnd = false
        interactiveIsEnd = false
        conclusionIsEnd = false
        
        onIntroduction = false
        onReceive = false
        onEnterName = false
        onUserReceived = false
        onInteractive = false
        onConclusion = false
        onSelectionResult = false
        
        behaviorIsPositive = false
        onInteractiveGuide = false
        
        onTypeOfHelp = false
        onEnd = false
        onSummary = false
    }
}
