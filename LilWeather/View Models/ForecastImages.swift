//
//  ForecastImages.swift
//  LilWeather
//
//  Created by Rob Maltese on 10/13/21.
//

import SwiftUI

struct ForecastImages: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "sun.min.fill")
            Image(systemName: "sun.max.fill")
            Image(systemName: "cloud")
            Image(systemName: "cloud.fill")
            Image(systemName: "cloud.rain")
            Image(systemName: "cloud.rain.fill")
            Image(systemName: "cloud.snow")
            Image(systemName: "cloud.snow.fill")
            Image(systemName: "cloud.bolt")
            Image(systemName: "clould.bolt.fill")
        }
        .font(.system(size: 24))
    }
}

struct ForecastImages_Previews: PreviewProvider {
    static var previews: some View {
        ForecastImages()
    }
}

enum ForecastImage {
    case sunny
    case cloudy
    case rain
    case snow
    case thunder
    case lightning
}

extension ForecastImage {
    var forecastImage: String? {
        switch self {
        case .sunny:
            return "sun.max.fill"
        case .cloudy:
            return "cloud.fill"
        case .rain:
            return "cloud.rain.fill"
        case .snow:
            return "cloud.snow"
        case .thunder:
            return "cloud.bolt"
        case .lightning:
            return "cloud.bolt.fill"
        }
    }
}
