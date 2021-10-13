//
//  WeatherModel.swift
//  LilWeather
//
//  Created by Rob Maltese on 10/12/21.
//

import Foundation

/*
 "forecast":[
 {
 "name":"Tonight",
 "temperature":61,
 "unit":"F",
 "description":"Partly Cloudy",
 },
 */

struct WeatherResponse: Codable {
    let forecast: [Forecast]
}

// MARK: - Forecast
struct Forecast: Codable, Identifiable {
    let id = UUID()
    let name: String
    let temperature: Int
    let unit, forecastDescription: String

    enum CodingKeys: String, CodingKey {
        case name, temperature, unit
        case forecastDescription = "description"
    }
}

extension Forecast {
    static var dummyData: Forecast {
        .init(
            name: "Tonight",
            temperature: 61,
            unit: "F",
            forecastDescription: "Partly Cloudy"
            )
    }
}
