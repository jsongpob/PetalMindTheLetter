//
//  CustomFonts.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 9/2/2568 BE.
//

import SwiftUI

class CustomFonts {
    func registerFontIfNeeded(fontName: String, fileName: String) {
        // Check if the font is already registered
        if UIFont.familyNames.contains(fontName) {
            print("Font '\(fontName)' is already registered, skipping registration.")
            return
        }

        guard let fontURL = Bundle.main.url(forResource: fileName, withExtension: "ttf"),
              let fontData = try? Data(contentsOf: fontURL) as CFData,
              let provider = CGDataProvider(data: fontData),
              let font = CGFont(provider) else {
            print("Failed to load font: \(fontName)")
            return
        }

        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            if let error = error?.takeRetainedValue() {
                print("Font '\(fontName)' registration failed: \(error.localizedDescription)")
            } else {
                print("Font '\(fontName)' is already registered.")
            }
        } else {
            print("Successfully registered font: \(fontName)")
        }
    }
}
