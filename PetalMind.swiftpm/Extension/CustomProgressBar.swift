//
//  ProgressBar.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 6/2/2568 BE.
//

import SwiftUI

struct CustomProgressBar: View {
    var width: CGFloat = 200
    var height: CGFloat = 20
    var percent: CGFloat = 90
    var color1: Color = Color(hex: 0xF16A6A)
    var color2: Color = Color(hex: 0xF04343)
    
    @State private var animatedPercent: CGFloat = 0
    
    var body: some View {
        let multiplier = width / 100
        
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
                .foregroundStyle(Color.gray.opacity(0.1))
            
            //Progress Main Bar
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: animatedPercent * multiplier, height: height)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .leading, endPoint: .trailing))
                .onAppear {
                    withAnimation(.spring(duration: 0.5)) {
                        animatedPercent = percent
                    }
                }
                .onChange(of: percent) { newValue in
                    // Trigger the animation whenever the percent changes
                    withAnimation(.easeInOut(duration: 0.5)) {
                        animatedPercent = newValue
                    }
                }
        }
    }
}

#Preview {
    CustomProgressBar()
}
