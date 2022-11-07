//
//  ContentView.swift
//  WakeUpFirebaseDemo
//
//  Created by Anagha Srikumar on 10/27/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var displayedWeather: Weather
  
    var body: some View {
      Text("Hello, world! Welcome to WakeUp")
      
    }
  
  
  
  func loadData() {
    Parser().fetchWeather { weather in
      self.viewModel.weather = weather
      
    }
  }

  func displayWeather() {
    displayedWeather = viewModel.weather
    
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
