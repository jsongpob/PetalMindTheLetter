//
//  PhotoModel.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 12/2/2568 BE.
//

import SwiftUI

class PhotoModel: ObservableObject {
    @Published var image: UIImage?
    @Published var isConfirming: Bool = false
    @Published var isImagePickerPresented: Bool = false
    @Published var sourceType: SourceType = .camera
    
    enum SourceType {
        case camera
        case photoLibrary
    }
}
