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
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            VStack {
                Text("Lil News & Weather")
                    .bold()
                    .font(.title)
                weather
            }
            .onAppear {
                weatherViewModel.getWeather()
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    var weather: some View {
        VStack(alignment: .leading) {
            Text("Forecast")
                .bold()
                .font(.title2)
                .padding(.horizontal)
            Group {
                switch weatherViewModel.state {
                case .loading:
                    ProgressView()
                case .success(content: let content):
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(content) { item in
                                WeatherView(forecast: item)
                            }
                        }
                        .padding(.horizontal)
                    }
                case .failed(error: let error):
                    ErrorView(error: error, handler: weatherViewModel.getWeather)
                }
            }
        }
    }
}
