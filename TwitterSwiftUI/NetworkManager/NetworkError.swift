//
//  NetworkError.swift
//  TwitterSwiftUI
//
//  Created by ANSK Vivek on 19/11/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case responseError
    case unknown
    case noData
    case decode
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL: "Invalid URL"
        case .responseError: "Unexpected status code"
        case .unknown: "Unknown error"
        case .noData: "Unable to get the data."
        case .decode: "Error while decoding the data."
        }
    }
}
