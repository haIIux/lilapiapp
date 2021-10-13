//
//  WeatherService.swift
//  LilWeather
//
//  Created by Rob Maltese on 10/12/21.
//

import Foundation
import Combine

protocol WeatherService {
    func request(from endpoint: LittleAPI) -> AnyPublisher<WeatherResponse, APIError>
}


struct WeatherServiceImplementation: WeatherService {
    
    func request(from endpoint: LittleAPI) -> AnyPublisher<WeatherResponse, APIError> {
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError{ _ in APIError.unknown }
            .flatMap { data, response -> AnyPublisher<WeatherResponse, APIError> in
                
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    let jsonDecoder = JSONDecoder()
                    
                    return Just(data)
                        .decode(type: WeatherResponse.self, decoder: jsonDecoder)
                        .mapError { _ in APIError.decodingError }
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}

