//
//  InteractiveLetter.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 5/2/2568 BE.
//

import SwiftUI

struct InteractiveLetter: View {
    @EnvironmentObject var interactiveModel: InteractiveModel
    @StateObject var stressManager = StressManager()
    @StateObject var dayManager = DayManager()
    
    //Initialize load fonts
    init() {
        if let fontURL = Bundle.main.url(
            forResource: "ShantellSans-SemiBold", withExtension: "ttf"),
            let fontData = try? Data(contentsOf: fontURL) as CFData,
            let provider = CGDataProvider(data: fontData),
            let font = CGFont(provider)
        {
            CTFontManagerRegisterGraphicsFont(font, nil)
        } else {
            print("Failed to register custom font 'titleFont'.")
        }

        if let exboldfontURL = Bundle.main.url(
            forResource: "ShantellSans-ExtraBold", withExtension: "ttf"),
            let exboldfontData = try? Data(contentsOf: exboldfontURL) as CFData,
            let exboldprovider = CGDataProvider(data: exboldfontData),
            let exboldfont = CGFont(exboldprovider)
        {
            CTFontManagerRegisterGraphicsFont(exboldfont, nil)
        } else {
            print("Failed to register custom font 'ExtraboldFont'.")
        }
        
        if let boldfontURL = Bundle.main.url(
            forResource: "ShantellSans-Bold", withExtension: "ttf"),
            let boldfontData = try? Data(contentsOf: boldfontURL) as CFData,
            let boldprovider = CGDataProvider(data: boldfontData),
            let boldfont = CGFont(boldprovider)
        {
            CTFontManagerRegisterGraphicsFont(boldfont, nil)
        } else {
            print("Failed to register custom font 'BoldFont'.")
        }
    }
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 2)

    var body: some View {
        ZStack {
            Image("letterPaperTexture")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                Text("State of his mind")
                    .font(.custom("ShantellSans-SemiBold", size: 20))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
                DayView(currentDay: dayManager.currentDay, dayLeft: dayManager.dayLeft)
                Brain(brainIndex: "BrainStateNormal")
                StressLevel(currentStessLevel: Int(stressManager.stressLevel), maxStressLevel: Int(stressManager.maxStressLevel))
                    .padding(.horizontal, 30)
                Group {
                    VStack(spacing: 0) {
                        Text("Behaviors")
                            .font(.custom("ShantellSans-ExtraBold", size: 24))
                            .foregroundColor(Color(hex: 0x483528))
                            .multilineTextAlignment(.center)
                        LazyVGrid(columns: columns, spacing: 5) {
                            // Filter behaviors to show only those that haven't been selected
                            ForEach(interactiveModel.randomizedBehaviors.filter { !$0.selected }, id: \.behaviorTitle) { behavior in
                                Button {
                                    interactiveModel.randomizeBehaviors()
                                    stressManager.updateStressLevel(for: behavior)
                                    dayManager.incrementDay()
                                    
                                    // Mark this behavior as selected
                                    if let index = interactiveModel.behaviors.firstIndex(where: { $0.behaviorTitle == behavior.behaviorTitle }) {
                                        interactiveModel.behaviors[index].selected = true
                                    }

                                } label: {
                                    BehaviorCard(behaviorTitle: behavior.behaviorTitle, buttonImage: behavior.buttonImage)
                                }
                            }
                            .transaction { transaction in
                                // Disable animation when updating the array
                                transaction.animation = nil
                            }
                        }
                        .onAppear {
                            // Randomize behaviors on view appearance
                            interactiveModel.randomizeBehaviors()
                        }

                        .padding(20)
                    }
                }
            }
            .padding(.vertical, 100)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct DayView: View {
    let currentDay: Int
    let dayLeft: Int
    
    var body: some View {
        ZStack {
            Image("PaperLetter")
                .resizable()
                .scaledToFit()
                .frame(width: 220, alignment: .center)
            VStack(spacing: 0) {
                Text("Day \(currentDay)")
                    .font(.custom("ShantellSans-Extrabold", size: 22))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
                Text("(\(dayLeft) day left)")
                    .font(.custom("ShantellSans-SemiBold", size: 16))
                    .foregroundColor(Color(hex: 0x483528))
                    .opacity(0.8)
                    .multilineTextAlignment(.center)
            }
            .frame(width: .infinity, height: 100, alignment: .center)
        }
    }
}

struct Brain: View {
    let brainIndex: String
    
    var body: some View {
        VStack {
            Image(brainIndex)
                .resizable()
                .scaledToFit()
                .frame(width: .infinity, height: 280, alignment: .center)
//                .background(Color(hex: 0xF2F2F2))
        }
    }
}

struct StressLevel: View {
    let currentStessLevel: Int
    let maxStressLevel: Int
    
    var body: some View {
        ZStack {
            Image("PaperLevel")
                .resizable()
                .scaledToFit()
            VStack(spacing: 5) {
                Text("Current stress level (\(currentStessLevel)/\(maxStressLevel))")
                    .font(.custom("ShantellSans-Bold", size: 14))
                    .foregroundColor(Color(hex: 0x483528))
                CustomProgressBar(width: 300, height: 12, percent: CGFloat(currentStessLevel), color1: Color(hex: 0xF16A6A), color2: Color(hex: 0xF04343))
            }
            .padding(.bottom, 10)
        }
        .frame(width: .infinity, height: 100, alignment: .center)
    }
}

struct BehaviorCard: View {
    let behaviorTitle: String
    let buttonImage: String
    
    var body: some View {
        ZStack {
            Image(buttonImage)
                .resizable()
                .scaledToFit()
            Text(behaviorTitle)
                .font(.custom("ShantellSans-Extrabold", size: 20))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
                .padding(.bottom, 2)
                .frame(width: 150, height: 60, alignment: .center)
        }
    }
}

#Preview {
    InteractiveLetter()
        .environmentObject(InteractiveModel())
}
