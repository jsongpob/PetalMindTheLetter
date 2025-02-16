//
//  ResultView.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 13/2/2568 BE.
//

import SwiftUI

class ResultViewModelContent: ObservableObject {
    @Published var currentPage: Int = 0
    @Published var pages: Array = [ResultViewContent1(), ResultViewContent2(), ResultViewContent3()]
    
    func nextPage() {
        if currentPage < pages.count - 1 {
            currentPage += 1
        }
    }
}

//
//  Best Case
//
struct ResultViewContent1: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("brainState1")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("You're doing great!")
                .font(.custom("ShantellSans-Extrabold", size: 26))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            Divider()
                .frame(minHeight: 1)
                .background(Color(hex: 0x483528))
                .padding(.horizontal, 80)
                .padding(.vertical, 20)
            VStack(spacing: 20) {
                VStack(spacing: 0) {
                    Text("Your choices of behavior have been \nreally good! Now, he is far away from")
                        .font(.custom("ShantellSans-Medium", size: 18))
                        .foregroundColor(Color(hex: 0x483528))
                        .multilineTextAlignment(.center)
                    Text("mental health issues!")
                        .font(.custom("ShantellSans-Semibold", size: 18))
                        .foregroundColor(Color(hex: 0xF28F46))
                        .multilineTextAlignment(.center)
                }
                Text("From now on, he will continue to \nengage in these positive behaviors \nregularly")
                    .font(.custom("ShantellSans-Medium", size: 18))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 10)
        }
    }
}

struct ResultViewContent2: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("You did great, but... \n\nThis is just a \nsimulated scenario!")
                .font(.custom("ShantellSans-Extrabold", size: 26))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            Divider()
                .frame(minHeight: 1)
                .background(Color(hex: 0x483528))
                .padding(.horizontal, 80)
                .padding(.vertical, 20)
            VStack(spacing: 20) {
                    Text("But if you're feeling unwell, \nstruggling, or facing difficulties, ")
                        .font(.custom("ShantellSans-Medium", size: 18))
                        .foregroundColor(Color(hex: 0x483528))
                        .multilineTextAlignment(.center)
                Group {
                    Text("please reach out")
                        .font(.custom("ShantellSans-Extrabold", size: 20))
                        .foregroundColor(Color(hex: 0x71CEA4))
                        .multilineTextAlignment(.center)
                    Text("to your local \nmental health department or \na support service in your area")
                        .font(.custom("ShantellSans-Medium", size: 18))
                        .foregroundColor(Color(hex: 0x483528))
                        .multilineTextAlignment(.center)
                }
            }
            .padding(.top, 10)
        }
    }
}

struct ResultViewContent3: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 20) {
                    Text("The sooner you seek help, \nthe better it will be for you")
                        .font(.custom("ShantellSans-Medium", size: 18))
                        .foregroundColor(Color(hex: 0x483528))
                        .multilineTextAlignment(.center)
                Group {
                    Text("Don't hesitate to \nget treatment")
                        .font(.custom("ShantellSans-Extrabold", size: 20))
                        .foregroundColor(Color(hex: 0xF28F46))
                        .multilineTextAlignment(.center)
                    Text("—there are people who are ready \nand willing to help you")
                        .font(.custom("ShantellSans-Medium", size: 18))
                        .foregroundColor(Color(hex: 0x483528))
                        .multilineTextAlignment(.center)
                }
            }
            .padding(.top, 10)
        }
    }
}

//
//  Well Case
//
struct ResultViewContentWell1: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("brainState3")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("You did well!")
                .font(.custom("ShantellSans-Extrabold", size: 26))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            Divider()
                .frame(minHeight: 1)
                .background(Color(hex: 0x483528))
                .padding(.horizontal, 80)
                .padding(.vertical, 20)
            VStack(spacing: 20) {
                VStack(spacing: 0) {
                    Text("Your choices of behavior have \nhelped him improve. Now, he is \nstarting to distance himself from ")
                        .font(.custom("ShantellSans-Medium", size: 18))
                        .foregroundColor(Color(hex: 0x483528))
                        .multilineTextAlignment(.center)
                    Text("mental health issues!")
                        .font(.custom("ShantellSans-Semibold", size: 18))
                        .foregroundColor(Color(hex: 0xF28F46))
                        .multilineTextAlignment(.center)
                }
                Text("If he can maintain these behaviors, \nthings may gradually improve, \nbut there’s also a chance that \nthe issues could return")
                    .font(.custom("ShantellSans-Medium", size: 18))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 10)
        }
    }
}

struct ResultViewContentWell2: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("You did well, but... \n\nThis is just a \nsimulated scenario!")
                .font(.custom("ShantellSans-Extrabold", size: 26))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            Divider()
                .frame(minHeight: 1)
                .background(Color(hex: 0x483528))
                .padding(.horizontal, 80)
                .padding(.vertical, 20)
            VStack(spacing: 20) {
                    Text("But if you're feeling unwell, \nstruggling, or facing difficulties, ")
                        .font(.custom("ShantellSans-Medium", size: 18))
                        .foregroundColor(Color(hex: 0x483528))
                        .multilineTextAlignment(.center)
                Group {
                    Text("please reach out")
                        .font(.custom("ShantellSans-Extrabold", size: 20))
                        .foregroundColor(Color(hex: 0x71CEA4))
                        .multilineTextAlignment(.center)
                    Text("to your local \nmental health department or \na support service in your area")
                        .font(.custom("ShantellSans-Medium", size: 18))
                        .foregroundColor(Color(hex: 0x483528))
                        .multilineTextAlignment(.center)
                }
            }
            .padding(.top, 10)
        }
    }
}

//
// Bad Case
//

struct ResultViewContentBad1: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("brainState5")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("You didn't do very well")
                .font(.custom("ShantellSans-Extrabold", size: 26))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            Divider()
                .frame(minHeight: 1)
                .background(Color(hex: 0x483528))
                .padding(.horizontal, 80)
                .padding(.vertical, 20)
            VStack(spacing: 20) {
                VStack(spacing: 0) {
                    Text("Your choices of behavior have been \ninappropriate. He is now facing")
                        .font(.custom("ShantellSans-Medium", size: 18))
                        .foregroundColor(Color(hex: 0x483528))
                        .multilineTextAlignment(.center)
                    Text("mental health issues!")
                        .font(.custom("ShantellSans-Semibold", size: 18))
                        .foregroundColor(Color(hex: 0xF28F46))
                        .multilineTextAlignment(.center)
                    Text("and urgently needs to be \naddressed")
                        .font(.custom("ShantellSans-Medium", size: 18))
                        .foregroundColor(Color(hex: 0x483528))
                        .multilineTextAlignment(.center)
                }
                Text("Right now, he needs urgent \ntreatment; otherwise, things could \nget worse for him")
                    .font(.custom("ShantellSans-Medium", size: 18))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 10)
        }
    }
}

struct ResultViewContentBad2: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("but it’s okay \n\nThis is just a \nsimulated scenario!")
                .font(.custom("ShantellSans-Extrabold", size: 26))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            Divider()
                .frame(minHeight: 1)
                .background(Color(hex: 0x483528))
                .padding(.horizontal, 80)
                .padding(.vertical, 20)
            VStack(spacing: 20) {
                    Text("But if you're feeling unwell, \nstruggling, or facing difficulties, ")
                        .font(.custom("ShantellSans-Medium", size: 18))
                        .foregroundColor(Color(hex: 0x483528))
                        .multilineTextAlignment(.center)
                Group {
                    Text("please reach out")
                        .font(.custom("ShantellSans-Extrabold", size: 20))
                        .foregroundColor(Color(hex: 0x71CEA4))
                        .multilineTextAlignment(.center)
                    Text("to your local \nmental health department or \na support service in your area")
                        .font(.custom("ShantellSans-Medium", size: 18))
                        .foregroundColor(Color(hex: 0x483528))
                        .multilineTextAlignment(.center)
                }
            }
            .padding(.top, 10)
        }
    }
}

struct ResultView: View {
    
//    @EnvironmentObject var pageViewModel: PageViewModel
//    @EnvironmentObject var userModel: UserModel
//    @EnvironmentObject var photoModel: PhotoModel
//    @EnvironmentObject var interactiveModel: InteractiveModel
//    @EnvironmentObject var storyModel: StoryModel
//    @EnvironmentObject var guideViewContentModel: GuideViewContentModel
//    @StateObject var stressManager = StressManager()
//    @StateObject var dayManager = DayManager()
//    @StateObject var brainManager = BrainManager()
    
    var body: some View {
        VStack {
            
        }
    }
    
//    private func resetAllToDefault() {
//        pageViewModel.displayLetter = false
//        pageViewModel.resetValue()
//        userModel.nameOfUser = ""
//        photoModel.image = nil
//        storyModel.currentIndexStory = 0
//        storyModel.currentIndexStory = 0
//        stressManager.stressLevel = 50.0
//        dayManager.currentDay = 1
//        dayManager.isDayOver = false
//        guideViewContentModel.currentPage = 0
//    }
}

#Preview {
    ResultViewContentBad2()
}
