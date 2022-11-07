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
        Button("LoadData", action: loadData)
        Text("Hello, world! Welcome to WakeUp")
        //Text("\(viewModel.weather!.weatherType)")
        Text("\(self.viewModel.weather!.weatherType)")
        //Text(self.viewModel.weather!)
      }.onAppear(perform: loadData)
    }
  
  
  
  func loadData() {
    WeatherParser().fetchWeather { (weather) in
      self.viewModel.weather = weather
      //self.displayedWeather = weather
      
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
