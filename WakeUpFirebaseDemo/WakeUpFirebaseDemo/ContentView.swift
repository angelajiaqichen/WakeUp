//
//  ContentView.swift
//  WakeUpFirebaseDemo
//
//  Created by Anagha Srikumar on 10/27/22.
//

import SwiftUI

struct ContentView: View {
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
