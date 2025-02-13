//
//  UserModel.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 12/2/2568 BE.
//

import SwiftUI

class UserModel: ObservableObject {
    @Published var nameOfUser: String = ""
    @Published var futureDate: Date = Calendar.current.date(byAdding: .year, value: 10, to: Date())!
}
