//
//  WeatherVM.swift
//  LilWeather
//
//  Created by Rob Maltese on 10/12/21.
//

import Foundation
import Combine

protocol WeatherViewModel {
    func getWeather()
}

class WeatherModelImplementation: ObservableObject, WeatherViewModel {
    
    private let service: WeatherService
    private var cancellables = Set<AnyCancellable>()
    private(set) var forecast = [Forecast]()
    
    @Published private(set) var state: WeatherResultState = .loading
    
    init(service: WeatherService) {
        self.service = service
    }
    
    func getWeather() {
        self.state = .loading
        
        let cancellable = service
            .request(from: .getWeather(long: "-73.956558", lat: "40.709335"))
            .sink { res in
                switch res {
                case .finished:
                    self.state = .success(content: self.forecast)
                case .failure(let error):
                    self.state = .failed(error: error)
                }
            } receiveValue: { response in
                self.forecast = response.forecast
            }
        self.cancellables.insert(cancellable)
    }
}

// https://api.lil.software/weather?latitude=40.709335&longitude=-73.956558
// https://api.lil.software/weather?latitude=-73.956558&longitude=40.709335

