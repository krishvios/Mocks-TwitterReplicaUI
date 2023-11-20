//
//  FeedModel.swift
//  TwitterSwiftUI
//
//  Created by ANSK Vivek on 18/11/23.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let timeLine = try? JSONDecoder().decode(TimeLine.self, from: jsonData)

// MARK: - TimeLine
struct TimeLine: Codable {
    let feed: Feed

    enum CodingKeys: String, CodingKey {
        case feed = "Feed"
    }
}

// MARK: - Feed
struct Feed: Codable {
    let posts: [Post]

    enum CodingKeys: String, CodingKey {
        case posts = "Posts"
    }
}

// MARK: - Post
struct Post: Codable, Equatable, Hashable {
    let profileName: String
    let profilePhoto: String?
    let timePosted: String?
    let type, text: String
    let url: String
    let likes, comments, retweets, impressions: String

    enum CodingKeys: String, CodingKey {
        case profileName = "ProfileName"
        case profilePhoto = "ProfilePhoto"
        case timePosted
        case type = "Type"
        case text = "Text"
        case url = "URL"
        case likes = "Likes"
        case comments = "Comments"
        case retweets = "Retweets"
        case impressions = "Impressions"
    }
}
