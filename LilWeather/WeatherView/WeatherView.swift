//
//  WeatherView.swift
//  LilWeather
//
//  Created by Rob Maltese on 10/12/21.
//

import SwiftUI

struct WeatherView: View {
    let forecast: Forecast
    
    var body: some View {
        VStack {
            Text(forecast.name)
                .bold()
                .font(.headline)
            Text(forecast.forecastDescription)
                .font(.subheadline)
            Text("\(forecast.temperature)\(forecast.unit)")
                .font(.caption)
        }
        .padding()
        .background(Color(.systemTeal).opacity(0.5))
        .foregroundColor(.black)
        .cornerRadius(10)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(forecast: Forecast.dummyData)
    }
}




