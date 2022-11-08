//
//  ContentView.swift
//  WakeUpFirebaseDemo
//
//  Created by Anagha Srikumar on 10/27/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    //@State var displayedWeather: Weather
  
   
    var body: some View {
      VStack{
        Text("Hello, world! Welcome to WakeUp")
        
        Text("\(self.viewModel.weatherType)")
        Text("\(self.viewModel.weatherTemp)")
        
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
/*
  func displayWeather() {
    displayedWeather = viewModel.weather!
    
  }*/
}

/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
