//
//  NewTweetViewModel.swift
//  TwitterSwiftUI
//
//  Created by ANSK Vivek on 18/11/23.
//

import Foundation
import Observation

@Observable
class NewTweetViewModel {
    var caption = ""
    var newTweetImages = [
        Media(title: "mic"),
        Media(title: "camera"),
        Media(title: "photo.circle"),
        Media(title: "photo.circle"),
        Media(title: "photo.circle"),
        Media(title: "photo.circle")
    ]
}

struct Media: Hashable, Equatable {
  let title: String
}
