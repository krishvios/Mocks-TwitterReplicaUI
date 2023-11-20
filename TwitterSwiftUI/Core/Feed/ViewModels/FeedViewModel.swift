//
//  FeedViewModel.swift
//  TwitterSwiftUI
//
//  Created by ANSK Vivek on 03/11/23.
//

import Foundation
import SwiftUI
import Combine
import Observation

enum FeedViewModelType: Int, CaseIterable {
    case foryou
    case following
    
    var title: String {
        switch self {
        case .foryou: "For you"
        case .following: "Following"
        }
    }
}

@Observable
class FeedViewModel {
    var posts : [Post] = []
    var cancellables = Set<AnyCancellable>()
    
    func getData() {
        NetworkManager.sharedInstance
            .getData(url: getJSONFileURL(forName: Constants.timeline), type: TimeLine.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            }
            receiveValue: { [weak self] response in
                print("response = \(response)")
                guard let self = self else { return }
                guard let timeLine = response.first else { return }
                self.posts = timeLine.feed.posts
                self.posts.forEach({ post in
                    print("profileName = \(post.profileName)\n")
                })

            }
            .store(in: &cancellables)
    }
    
    func getJSONFileURL(forName name: String) -> URL? {
        if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
            let fileUrl = URL(fileURLWithPath: filePath)
            return fileUrl
        }
        return nil
    }

    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
