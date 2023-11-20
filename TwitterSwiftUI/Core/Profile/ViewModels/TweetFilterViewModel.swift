//
//  TweetFilterViewModel.swift
//  TwitterSwiftUI
//
//  Created by ANSK Vivek on 02/11/23.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets: "Tweets"
        case .replies: "Replies"
        case .likes: "Likes"
        }
    }
}
