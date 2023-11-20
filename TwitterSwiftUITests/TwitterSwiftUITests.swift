//
//  TwitterSwiftUITests.swift
//  TwitterSwiftUITests
//
//  Created by ANSK Vivek on 02/11/23.
//

import XCTest
import Combine
@testable import TwitterSwiftUI

final class TwitterSwiftUITests: XCTestCase {

    private var networkingService: MockNetworkManager?
    private var cancellables: Set<AnyCancellable>!
    var posts:[Post]?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cancellables = []
        networkingService = MockNetworkManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        networkingService = nil
        posts = nil
        cancellables = nil
    }

    func testGetData() {
        let expectation = self.expectation(description: "Fetch feeds for the user.")
        
        networkingService?.getMockData(endPoint: "", parameters: [:], type: TimeLine.self)
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
                self.posts?.forEach({ post in
                    print("profileName = \(post.profileName)\n")
                })
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1)
        
        XCTAssertEqual(self.posts?.first?.profileName, "Vivek ANSK")
        XCTAssertEqual(self.posts?.first?.type, "Text")
        XCTAssertEqual(self.posts?.first?.text, "Hello! Friends")
        
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

class MockNetworkManager: NetworkManager {
    let mockTimeLine =
    [TimeLine(feed: Feed(posts: [Post(profileName: "Vivek ANSK", profilePhoto: "https://pbs.twimg.com/profile_images/1653054466059321346/9nuQQ83V_400x400.jpg", timePosted: "3d", type: "Text", text: "Hello! Friends", url: "", likes: "127", comments: "26", retweets: "42", impressions: "150000")]))]

    func fetchData(id: String) -> AnyPublisher<[TimeLine], Error> {
            Future { promise in
                promise(.success(self.mockTimeLine))
            }
            .eraseToAnyPublisher()
        }
    
    func getMockData(endPoint: String? = nil, parameters: [String: String], type: TimeLine.Type) -> Future<[TimeLine], Error> {
        Future<[TimeLine], Error> { promise in
            promise(.success(self.mockTimeLine))
        }
    }
}
