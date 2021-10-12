//
//  Endpoints.swift
//  LilWeather
//
//  Created by Rob Maltese on 10/12/21.
//

import Foundation

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
    #error("Finish the weather one to function properly from the user input.")
    var path: String {
        switch self {
        case .getWeather :
            return "/weather"
        case .news:
            return "/news"
        }
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseURL.appendingPathComponent(self.path))
    }
    
    
}
