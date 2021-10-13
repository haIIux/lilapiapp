//
//  Errors.swift
//  LilWeather
//
//  Created by Rob Maltese on 10/12/21.
//

import Foundation

/**
Conforms to type Error.
 - returns:
 - decodingError:
        Handles decoding failures, for instance if the structure of the data returned changes.
 - errorCode:
        Will throw a status code with an associated number.
 - unknown:
        Unknown handles all other errors.
 */

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Failed to decode the object from the server!"
        case .errorCode(let code):
            return "\(code) - Something went wrong!"
        case .unknown:
            return "An unknown error occurred 🤷🏽‍♂️. "
        }
    }
}
