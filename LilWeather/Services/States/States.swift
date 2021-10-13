//
//  States.swift
//  LilWeather
//
//  Created by Rob Maltese on 10/12/21.
//

import Foundation


enum WeatherResultState {
    case loading
    case success(content: [Forecast])
    case failed(error: Error)
}

//enum NewsResultState {
//    case loading
//    case success(content: [Article])
//    case failed(error: Error)
//}
