//
//  StoryModel.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 4/2/2568 BE.
//

import Foundation

class StoryModel: ObservableObject {
    @Published var introStoryCurrentPage: Int = 0
    @Published var currentIndexStory: Int = 0
}

struct Story {
    let text: String
    let buttontitle: String
    let imageName: String
}

let storyData: [Story] = [
    Story(text:"After a long day, a teenager finally returned home and went to sit in his room.", buttontitle:"Next", imageName:"MailIcon"),
    Story(text: "Then, he started to cry.", buttontitle:"Oh... \nWhat happened?", imageName: "MailIcon"),
    Story(text: "He is going to keep crying, and he's about to do something harmful to himself, day after day.", buttontitle:"What can I do \nto help?", imageName: ""),
    Story(text: "I'm sorry to tell you.... \n\nthat you can't help him heal \nright away... \n\nBut you can help him change his behavior, so it gets better \nlittle by little.", buttontitle:"How?", imageName: "")
]
