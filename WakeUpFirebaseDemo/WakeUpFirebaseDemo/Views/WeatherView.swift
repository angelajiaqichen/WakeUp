//
//  WeatherView.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/6/22.
//

import SwiftUI

struct WeatherView: View {
    //var weather: Weather
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack{
            Text("Today's Forecast").font(.largeTitle)
            Spacer()
            Text("\(String(format: "%.0f", self.viewModel.weatherTemp))ºF")
            Text("\(self.viewModel.weatherType)")
            Spacer()
            Spacer()
            
        }.onAppear(perform: loadData)
        
    }
    
    func loadData() {
        WeatherParser().fetchWeather { (weather) in
            
            print(weather)
            print(weather.weatherDetails.imperial.value)
            self.viewModel.weatherType = weather.weatherType
            self.viewModel.weatherTemp = weather.weatherDetails.imperial.value
            
        }
        
    }
}

