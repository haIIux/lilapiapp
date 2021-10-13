//
//  Endpoints.swift
//  LilWeather
//
//  Created by Rob Maltese on 10/12/21.
//

import Foundation
// https://api.lil.software/weather?latitude=40.709335&longitude=-73.956558

/// This is used to ensure reusability. If we were working with multiple API endpoints, we would reuse this builder.
protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseURL: URL { get }
    var path: String { get }
}

enum LittleAPI {
    case getWeather
    case news
}

extension LittleAPI: APIBuilder {
    var baseURL: URL {
        switch self {
        case .getWeather :
            return URL(string: "https://api.lil.software")!
        case .news:
            return URL(string: "https://api.lil.software")!
        }
    }

    var path: String {
        switch self {
        case .getWeather :
            return "/weather?latitude=40.709335&longitude=-73.956558" // "/weather?latitude=\(double here)&longitude=\(double here)"
        case .news:
            return "/news"
        }
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseURL.appendingPathComponent(self.path))
    }
    
    
}
