//
//  GuideViewContent.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 10/2/2568 BE.
//

import SwiftUI

class GuideViewContentModel: ObservableObject {
    @Published var currentPage: Int = 0
    @Published var pages: Array = [GuideViewContent1(), GuideViewContent2(), GuideViewContent3()]
    
    func nextPage() {
        if currentPage < pages.count - 1 {
            currentPage += 1
        }
    }
}

struct GuideViewContent1: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 15) {
                Text("1/3")
                    .font(.custom("ShantellSans-Medium", size: 14))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
                Text("This is his brain.... \nAnd the stress level")
                    .font(.custom("ShantellSans-SemiBold", size: 16))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
            }
            Image("brainState3")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            StressLevel(currentStessLevel: 50, maxStressLevel: 100)
                .frame(width: 350)
                .scaledToFit()
            VStack(spacing: 20) {
                Text("The goal is...")
                    .font(.custom("ShantellSans-Extrabold", size: 24))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
                Text("Help him reduce his stress level by \nlowering it as much as possible")
                    .font(.custom("ShantellSans-Medium", size: 18))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 10)
        }
    }
}

struct GuideViewContent2: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 15) {
                Text("2/3")
                    .font(.custom("ShantellSans-Medium", size: 14))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
                Text("And these are the behaviors")
                    .font(.custom("ShantellSans-SemiBold", size: 16))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
            }
            BehaviorCard(behaviorTitle: "Lack of Sleep", buttonImage: "BehaviorButtonLeft")
                .scaledToFit()
                .frame(width: 200, height: 150)
            VStack(spacing: 20) {
                Text("The task is to")
                    .font(.custom("ShantellSans-Extrabold", size: 24))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
                Text("choose behaviors by \nSelecting positive and appropriate \nbehaviors")
                    .font(.custom("ShantellSans-Medium", size: 18))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
                Divider()
                    .frame(minHeight: 1)
                    .background(Color(hex: 0x483528))
                    .padding(.horizontal, 80)
                    .padding(.vertical, 20)
                VStack(spacing: 25) {
                    VStack {
                        Text("Choosing")
                        Text("“positive behaviors“")
                            .foregroundColor(Color(hex: 0x71CEA4))
                        Text("will help reduce stress levels")
                    }
                    VStack {
                        Text("while selecting ")
                        Text("“negative behaviors“")
                            .foregroundColor(Color(hex: 0xF28F46))
                        Text("will, in contrast, increase them")
                    }
                }
                .font(.custom("ShantellSans-Medium", size: 18))
                .foregroundColor(Color(hex: 0x483528))
            }
        }
    }
}

struct GuideViewContent3: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 15) {
                Text("3/3")
                    .font(.custom("ShantellSans-Medium", size: 14))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
                Text("And this is the day")
                    .font(.custom("ShantellSans-SemiBold", size: 16))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
            }
            DayView(currentDay: 1, dayLeft: 4)
                .scaledToFit()
                .frame(width: 220, height: 300)
            VStack(spacing: 20) {
                VStack {
                    HStack {
                        Text("You have a total of ")
                            .font(.custom("ShantellSans-Medium", size: 18))
                            .foregroundColor(Color(hex: 0x483528))
                            .multilineTextAlignment(.center)
                        Text("5 days")
                            .font(.custom("ShantellSans-Medium", size: 18))
                            .foregroundColor(Color(hex: 0xF28F46))
                            .multilineTextAlignment(.center)
                    }
                    Text("to help change his behavior")
                        .font(.custom("ShantellSans-Semibold", size: 18))
                        .foregroundColor(Color(hex: 0x483528))
                        .multilineTextAlignment(.center)
                }
                Divider()
                    .frame(minHeight: 1)
                    .background(Color(hex: 0x483528))
                    .padding(.horizontal, 80)
                    .padding(.vertical, 20)
                VStack(spacing: 25) {
                    VStack(spacing: 15) {
                        Text("Each time you choose one behavior, \none day will pass")
                            .font(.custom("ShantellSans-SemiBold", size: 16))
                            .multilineTextAlignment(.center)
                        Text("Try to use as little time as possible!")
                            .font(.custom("ShantellSans-Medium", size: 16))
                    }
                }
                .foregroundColor(Color(hex: 0x483528))
            }
        }
    }
}

#Preview {
    GuideViewContent3()
}
