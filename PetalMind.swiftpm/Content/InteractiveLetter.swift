//
//  InteractiveLetter.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 5/2/2568 BE.
//

import SwiftUI

struct InteractiveLetter: View {
    
    @EnvironmentObject var pageViewModel: PageViewModel
    @EnvironmentObject var interactiveModel: InteractiveModel
    @EnvironmentObject var guideViewContentModel: GuideViewContentModel
    @StateObject var stressManager = StressManager()
    @StateObject var dayManager = DayManager()
    @StateObject var brainManager = BrainManager()
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 2)

    var body: some View {
        ZStack {
            Image("letterPaperTexture")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                
//                Group {
                    Text("State of his mind")
                        .font(.custom("ShantellSans-SemiBold", size: 20))
                        .foregroundColor(Color(hex: 0x483528))
                        .multilineTextAlignment(.center)
                
                DayView(currentDay: dayManager.currentDay, dayLeft: dayManager.dayLeft)
                Brain(brainStates: brainManager.brainImage)
                StressLevel(currentStessLevel: Int(stressManager.stressLevel), maxStressLevel: Int(stressManager.maxStressLevel))
                    .padding(.horizontal, 30)
//                }
                
                if (!pageViewModel.onSelectionResult) {
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
                                        if (dayManager.currentDay <= dayManager.maxDays && !dayManager.isDayOver) {
                                            
                                            interactiveModel.randomizeBehaviors()
                                            stressManager.updateStressLevel(for: behavior)
                                            dayManager.incrementDay()
                                            pageViewModel.showSelectionResult(for: behavior)
                                            brainManager.updateBrainState(stressLevel: stressManager.stressLevel)
                                            
                                        } else {
                                            print("cannot increment day because dayManager.currentDay (\(dayManager.currentDay)) is less than or equal to dayManager.maxDays (\(dayManager.maxDays))")
                                        }
                                        
                                        // Mark this behavior as selected
                                        if let index = interactiveModel.behaviors.firstIndex(where: { $0.behaviorTitle == behavior.behaviorTitle }) {
                                            interactiveModel.behaviors[index].selected = true
                                        }
                                        
                                    } label: {
                                        BehaviorCard(behaviorTitle: behavior.behaviorTitle, buttonImage: behavior.buttonImage)
                                    }
                                }
                                .transaction { transaction in
                                    transaction.animation = nil
                                }
                            }
                            .onAppear {
                                interactiveModel.randomizeBehaviors()
                            }
                            .padding(20)
                        }
                    }
                } else {
                    SelectionResult(behaviorIsPositive: pageViewModel.behaviorIsPositive)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    pageViewModel.onSelectionResult = false
                                }
                            }
                        }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .overlay {
            if (pageViewModel.onInteractiveGuide) {
                GuideView(currentPage: guideViewContentModel.currentPage)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .background(.black.opacity(0.5))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            if guideViewContentModel.currentPage < guideViewContentModel.pages.count - 1 {
                                guideViewContentModel.nextPage()
                            } else {
                                pageViewModel.onInteractiveGuide = false
                            }
                        }
                    }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeInOut(duration: 0.2)) {
                    pageViewModel.onInteractiveGuide = true
                }
            }
        }
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
        }
    }
}

struct Brain: View {
    let brainStates: String
    
    var body: some View {
        VStack {
            Image(brainStates)
                .resizable()
                .scaledToFit()
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

struct SelectionResult: View {
    let behaviorIsPositive: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            Text("You've chosen a")
                .font(.custom("ShantellSans-SemiBold", size: 20))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            if (behaviorIsPositive) {
                Group {
                    Text("“positive behavior”")
                        .font(.custom("ShantellSans-ExtraBold", size: 36))
                        .foregroundColor(Color(hex: 0x71CEA4))
                        .multilineTextAlignment(.center)
                    Text("His stress level has decreased!")
                        .font(.custom("ShantellSans-SemiBold", size: 20))
                        .foregroundColor(Color(hex: 0x483528))
                        .multilineTextAlignment(.center)
                }
            } else {
                Group {
                    Text("“Negative behavior”")
                        .font(.custom("ShantellSans-ExtraBold", size: 36))
                        .foregroundColor(Color(hex: 0xF28F46))
                        .multilineTextAlignment(.center)
                    Text("causing his stress level to increase")
                        .font(.custom("ShantellSans-SemiBold", size: 20))
                        .foregroundColor(Color(hex: 0x483528))
                        .multilineTextAlignment(.center)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct GuideView: View {
    let currentPage: Int

    var body: some View {
        ZStack {
            Image("overlayPaper")
                .resizable()
                .scaledToFit()
            VStack(spacing: 0) {
                
                switch currentPage {
                case 0:
                    GuideViewContent1()
                case 1:
                    GuideViewContent2()
                case 2:
                    GuideViewContent3()
                default:
                    GuideViewContent1()
                }
                
                Spacer()
                
                Image("ArrowRightIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            .frame(maxWidth: .infinity, maxHeight: 650, alignment: .center)
        }
    }
}

#Preview {
    InteractiveLetter()
        .environmentObject(InteractiveModel())
        .environmentObject(PageViewModel())
        .environmentObject(GuideViewContentModel())
}
