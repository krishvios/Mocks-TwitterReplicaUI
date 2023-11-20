//
//  SideMenuViewModel.swift
//  TwitterSwiftUI
//
//  Created by ANSK Vivek on 03/11/23.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case lists
    case bookmarks
    case logout
    
    var title: String {
        switch self {
        case .profile: "Profile"
        case .lists: "Lists"
        case .bookmarks: "Bookmarks"
        case .logout: "Logout"
        }
    }
    
    var imageName: String {
        switch self {
        case .profile: "person"
        case .lists: "list.bullet"
        case .bookmarks: "bookmark"
        case .logout: "arrow.left.square"
        }
    }
}
