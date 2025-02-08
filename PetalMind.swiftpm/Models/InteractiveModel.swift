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
    let stressLevel: Double
    let increase: Bool
    var selected: Bool
}

class InteractiveModel: ObservableObject {
    @Published var randomizedBehaviors: [Behavior] = []
    
    @Published var behaviors: [Behavior] = [
        // Good behaviors
        Behavior(behaviorTitle: "Exercise", buttonImage: "BehaviorButtonLeft", stressLevel: 10.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Healthy Eating", buttonImage: "BehaviorButtonLeft", stressLevel: 5.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Family Time", buttonImage: "BehaviorButtonLeft", stressLevel: 10.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Learning Skills", buttonImage: "BehaviorButtonLeft", stressLevel: 10.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Focused Work", buttonImage: "BehaviorButtonLeft", stressLevel: 10.0, increase: false, selected: false),
        
        // More good behaviors (9 additional)
        Behavior(behaviorTitle: "Meditation", buttonImage: "BehaviorButtonLeft", stressLevel: 8.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Taking Breaks", buttonImage: "BehaviorButtonLeft", stressLevel: 8.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Reading", buttonImage: "BehaviorButtonLeft", stressLevel: 5.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Creative Hobbies", buttonImage: "BehaviorButtonLeft", stressLevel: 6.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Journaling", buttonImage: "BehaviorButtonLeft", stressLevel: 4.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Socializing", buttonImage: "BehaviorButtonLeft", stressLevel: 6.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Sleep Well", buttonImage: "BehaviorButtonLeft", stressLevel: 5.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Organize Tasks", buttonImage: "BehaviorButtonLeft", stressLevel: 4.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Outdoor Time", buttonImage: "BehaviorButtonLeft", stressLevel: 7.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Positive Mind", buttonImage: "BehaviorButtonLeft", stressLevel: 3.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Helping Others", buttonImage: "BehaviorButtonLeft", stressLevel: 8.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Positive Affirmations", buttonImage: "BehaviorButtonLeft", stressLevel: 5.0, increase: false, selected: false),
        Behavior(behaviorTitle: "Gratitude Practice", buttonImage: "BehaviorButtonLeft", stressLevel: 6.0, increase: false, selected: false),
        
        // Bad behaviors
        Behavior(behaviorTitle: "Avoiding Problems", buttonImage: "BehaviorButtonRight", stressLevel: 20.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Negative Self-talk", buttonImage: "BehaviorButtonRight", stressLevel: 20.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Overworking", buttonImage: "BehaviorButtonRight", stressLevel: 10.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Judging Others", buttonImage: "BehaviorButtonRight", stressLevel: 10.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Unhealthy Eating", buttonImage: "BehaviorButtonRight", stressLevel: 10.0, increase: true, selected: false),
        
        // More bad behaviors (9 additional)
        Behavior(behaviorTitle: "Excessive Social Media", buttonImage: "BehaviorButtonRight", stressLevel: 12.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Delaying Tasks", buttonImage: "BehaviorButtonRight", stressLevel: 12.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Avoiding Duties", buttonImage: "BehaviorButtonRight", stressLevel: 18.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Isolation", buttonImage: "BehaviorButtonRight", stressLevel: 15.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Anger Issues", buttonImage: "BehaviorButtonRight", stressLevel: 18.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Junk Food", buttonImage: "BehaviorButtonRight", stressLevel: 14.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Complaining", buttonImage: "BehaviorButtonRight", stressLevel: 13.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Poor Sleep", buttonImage: "BehaviorButtonRight", stressLevel: 15.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Being Late", buttonImage: "BehaviorButtonRight", stressLevel: 10.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Ignoring Health", buttonImage: "BehaviorButtonRight", stressLevel: 17.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Anger Outbursts", buttonImage: "BehaviorButtonRight", stressLevel: 18.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Ignoring Feelings", buttonImage: "BehaviorButtonRight", stressLevel: 12.0, increase: true, selected: false),
        Behavior(behaviorTitle: "Living in the Past", buttonImage: "BehaviorButtonRight", stressLevel: 14.0, increase: true, selected: false)
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
    @Published var stressLevel: Double = 50.0 // Initial stress level
    @Published var maxStressLevel: Double = 100.0

    func updateStressLevel(for behavior: Behavior) {
        if behavior.increase {
            stressLevel += behavior.stressLevel
        } else {
            stressLevel -= behavior.stressLevel
        }

        // Prevent stress level from dropping below 0
        stressLevel = min(max(stressLevel, 0), 100)
    }
}

class DayManager: ObservableObject {
    @Published var currentDay: Int = 1
    let maxDays: Int = 5
    
    var dayLeft: Int {
        return maxDays - currentDay
    }
    
    func incrementDay() {
        if currentDay < maxDays {
            currentDay += 1
        }
    }
}
