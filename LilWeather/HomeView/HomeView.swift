//
//  HomeView.swift
//  LilWeather
//
//  Created by Rob Maltese on 10/12/21.
//

import SwiftUI
//#error("Weather API not working, likely need to go back to the basics for API calls.")
struct HomeView: View {
    @StateObject var weatherViewModel = WeatherModelImplementation(service: WeatherServiceImplementation())
    var body: some View {
        VStack {
            Text("Lil News & Weather")
                .bold()
                .font(.title)
            VStack {
                Text("Forecast")
                Group {
                    switch weatherViewModel.state {
                    case .loading:
                        ProgressView()
                    case .success(content: let content):
                        ScrollView(.horizontal) {
                            ForEach(content) { item in
                                WeatherView(forecast: item)
                            }
                        }
                    case .failed(error: let error):
                        ErrorView(error: error, handler: weatherViewModel.getWeather)
                    }
                }
            }
        }
        .onAppear {
            weatherViewModel.getWeather()
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

