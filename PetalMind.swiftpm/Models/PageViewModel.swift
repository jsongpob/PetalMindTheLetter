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
}
