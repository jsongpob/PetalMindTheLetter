//
//  InteractiveModel.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 6/2/2568 BE.
//

import SwiftUI
import Foundation

struct Behavior: Identifiable {
    let id = UUID()
    let behaviorTitle: String
    let buttonImage: String
    let iconImage: String
    let stressLevel: Double
    let increase: Bool
    var selected: Bool
}

class InteractiveModel: ObservableObject {
    @Published var randomizedBehaviors: [Behavior] = []
    
    @Published var behaviors: [Behavior] = [
        // Good behaviors
        Behavior(behaviorTitle: "Exercise", buttonImage: "BehaviorButtonLeft", iconImage: "exercise", stressLevel: 15.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Healthy Eating", buttonImage: "BehaviorButtonLeft", iconImage: "healthyEat", stressLevel: 15.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Family Time", buttonImage: "BehaviorButtonLeft", iconImage: "familyTime", stressLevel: 10.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Learning Skills", buttonImage: "BehaviorButtonLeft", iconImage: "learningSkill", stressLevel: 10.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Focused Work", buttonImage: "BehaviorButtonLeft", iconImage: "focusedWork", stressLevel: 10.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Meditation", buttonImage: "BehaviorButtonLeft", iconImage: "meditation", stressLevel: 20.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Taking Breaks", buttonImage: "BehaviorButtonLeft", iconImage: "takingBreak", stressLevel: 10.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Reading", buttonImage: "BehaviorButtonLeft", iconImage: "reading", stressLevel: 10.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Creative Hobbies", buttonImage: "BehaviorButtonLeft", iconImage: "hobbies", stressLevel: 10.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Journaling", buttonImage: "BehaviorButtonLeft", iconImage: "journaling", stressLevel: 10.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Socializing", buttonImage: "BehaviorButtonLeft", iconImage: "socializing", stressLevel: 10.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Sleep Well", buttonImage: "BehaviorButtonLeft", iconImage: "sleepWell", stressLevel: 15.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Organize Tasks", buttonImage: "BehaviorButtonLeft", iconImage: "organizeTask", stressLevel: 5.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Outdoor Time", buttonImage: "BehaviorButtonLeft", iconImage: "outdoorTime", stressLevel: 10.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Positive Mind", buttonImage: "BehaviorButtonLeft", iconImage: "positiveMind", stressLevel: 15.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Helping Others", buttonImage: "BehaviorButtonLeft", iconImage: "helpingOther", stressLevel: 10.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Positive Affirmations", buttonImage: "BehaviorButtonLeft", iconImage: "positiveAffirmations", stressLevel: 10.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Gratitude Practice", buttonImage: "BehaviorButtonLeft", iconImage: "gratitudePractice", stressLevel: 5.0, increase: false, selected: false),
        
        // Bad behaviors
        Behavior(behaviorTitle: "Avoiding Problems", buttonImage: "BehaviorButtonRight", iconImage: "avoidingProblems", stressLevel: 10.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Negative Self-talk", buttonImage: "BehaviorButtonRight", iconImage: "negativeSelfTalk", stressLevel: 20.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Overworking", buttonImage: "BehaviorButtonRight", iconImage: "overworking", stressLevel: 10.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Judging Others", buttonImage: "BehaviorButtonRight", iconImage: "judgingOther", stressLevel: 10.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Unhealthy Eating", buttonImage: "BehaviorButtonRight", iconImage: "unhealthyFood", stressLevel: 10.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Excessive Social Media", buttonImage: "BehaviorButtonRight", iconImage: "excessiveSocial", stressLevel: 10.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Delaying Tasks", buttonImage: "BehaviorButtonRight", iconImage: "delayingTasks", stressLevel: 5.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Avoiding Duties", buttonImage: "BehaviorButtonRight", iconImage: "avoidingDuties", stressLevel: 10.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Isolation", buttonImage: "BehaviorButtonRight", iconImage: "isolation", stressLevel: 15.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Anger Issues", buttonImage: "BehaviorButtonRight", iconImage: "angerIssues", stressLevel: 10.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Junk Food", buttonImage: "BehaviorButtonRight", iconImage: "junkFood", stressLevel: 10.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Complaining", buttonImage: "BehaviorButtonRight", iconImage: "complaining", stressLevel: 10.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Poor Sleep", buttonImage: "BehaviorButtonRight", iconImage: "poorSleep", stressLevel: 15.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Being Late", buttonImage: "BehaviorButtonRight", iconImage: "beingLate", stressLevel: 10.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Ignoring Health", buttonImage: "BehaviorButtonRight", iconImage: "ignoringHealth", stressLevel: 20.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Anger Outbursts", buttonImage: "BehaviorButtonRight", iconImage: "angerOutbursts", stressLevel: 10.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Ignoring Feelings", buttonImage: "BehaviorButtonRight", iconImage: "ignoringFeeling", stressLevel: 10.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Living in the Past", buttonImage: "BehaviorButtonRight", iconImage: "livingInPast", stressLevel: 10.0, increase: true, selected: false)
    ]

    // Split behaviors by increase value
    var goodBehaviors: [Behavior] {
        return behaviors.filter { !$0.increase && !$0.selected }
    }
    
    var badBehaviors: [Behavior] {
        return behaviors.filter { $0.increase && !$0.selected }
    }
    
    // Randomize the behaviors
    func randomizeBehaviors() {
        let randomGood = goodBehaviors.shuffled().prefix(3) // Take 3 random good behaviors
        let randomBad = badBehaviors.shuffled().prefix(3) // Take 3 random bad behaviors
        
        // Combine the selected behaviors
        randomizedBehaviors = Array(randomGood + randomBad).shuffled() // Shuffle them together
    }
}

class StressManager: ObservableObject {
    @Published var stressLevel: Double = 50.0
    @Published var maxStressLevel: Double = 100.0
    @Published var checkStressLevelType: String = "Type1"

    func updateStressLevel(for behavior: Behavior) {
        if behavior.increase {
            stressLevel += behavior.stressLevel
        } else {
            stressLevel -= behavior.stressLevel
        }
        // Prevent stress level from dropping below 0
        stressLevel = min(max(stressLevel, 0), 100)
    }
    
    public func updateType(stressLevel: Double) {
        let newType = changeStressLevelType(stressLevel: stressLevel)
        checkStressLevelType = newType
        
        print("change type to \(checkStressLevelType) current stress level is \(stressLevel)")
    }
    
    func changeStressLevelType(stressLevel: Double) -> String {
        if (stressLevel < 20) {
            return "Type1"
        } else if (stressLevel >= 20 && stressLevel <= 60) {
            return "Type2"
        } else {
            return "Type3"
        }
    }
}

class DayManager: ObservableObject {
    @Published var isDayOver: Bool = false
    @Published var currentDay: Int = 1
    let maxDays: Int = 5
    
    var dayLeft: Int {
        return maxDays - currentDay
    }
    
    func incrementDay() {
        if currentDay < maxDays {
            currentDay += 1
        } else {
            isDayOver = true
        }
    }
}

class BrainManager: ObservableObject {
    @Published var brainImage: String = "brainState3"
    
    public func updateBrainState(stressLevel: Double) {
        let newImage = changeBrainStatePicture(stressLevel: stressLevel)
        
        withAnimation {
            brainImage = newImage
        }
    }
    
    func changeBrainStatePicture(stressLevel: Double) -> String {
        switch stressLevel {
        case ...20:
            return "brainState1"
        case 21...40:
            return "brainState2"
        case 41...60:
            return "brainState3"
        case 61...80:
            return "brainState4"
        case 81...100:
            return "brainState5"
        default:
            return "brainState3"
        }
    }
}
