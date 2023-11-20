//
//  NetworkManager.swift
//  TwitterSwiftUI
//
//  Created by ANSK Vivek on 19/11/23.
//

import Foundation
import Combine

class NetworkManager {
    
    private let session = URLSession.shared
    static let sharedInstance = NetworkManager()
    private var cancellables = Set<AnyCancellable>()
    
    /// Make Network Request
    typealias RequestCompletionHandler<T: Decodable> = (_ value: T?, _ error: Error?) -> Void
    
    /*
    func getData (url: URL) {
        let token = URLSession.shared.dataTaskPublisher(for: url)
        // 1
        .sink(receiveCompletion: { (completion) in
            switch completion {
            // 2
            case .finished:
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }) { (timeLine: TimeLine) in
            // 3
            timeLine.feed.posts.forEach({ post in
                print("profileName = \(post.profileName)\n")
            })
        }
    }
     */
    
    func getData<T: Decodable>(url: URL?, type: T.Type) -> Future<[T], Error> {
        
        /*
        let token = URLSession.shared.dataTaskPublisher(for: url!)
        // 1
        .sink(receiveCompletion: { (completion) in
            switch completion {
            // 2
            case .finished:
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }) { (timeLine: TimeLine) in
            // 3
            timeLine.feed.posts.forEach({ post in
                print("profileName = \(post.profileName)\n")
            })
        }
        */
        
        return Future<[T], Error> { [weak self] promise in
            guard let self = self, let url = url else {
                return promise(.failure(NetworkError.invalidURL))
            }
            session.dataTaskPublisher(for: url)
                .tryMap { (data, response) -> Data in
                    print("response = \(response)")
                    let timeLine = try? JSONDecoder().decode(TimeLine.self, from: data)
                    print("timeLine = \(String(describing: timeLine))")
                    /* comment this line for offline data */
                    /*
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                        throw NetworkError.responseError
                    }
                     */
                    return data
                }
                .decode(type: [T].self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { (completion) in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
                }, receiveValue: { line in
                    promise(.success(line))
                })
                .store(in: &self.cancellables)
        }
        
    }
    
    /*
    func getData<T: Decodable>(endPoint: String? = nil, parameters: [String: String], type: T.Type) -> Future<[T], Error> {
        
        var components = URLComponents(string: Constants.baseURL)!
        if let endPoint = endPoint {
            components.path = endPoint
        }
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")

        return Future<[T], Error> { [weak self] promise in
            guard let self = self, let url = URL(string: Constants.baseURL.appending(endPoint!)) else {
                return promise(.failure(NetworkError.invalidURL))
            }
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                        throw NetworkError.responseError
                    }
                    return data
                }
                .decode(type: [T].self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { (completion) in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
                }, receiveValue: { line in
                    promise(.success(line))
                })
                .store(in: &self.cancellables)
        }
    }
     */
    
    
}
