//
//  ViewModel.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/7/22.
//

import Foundation

class ViewModel: ObservableObject {
  
  // instance of parser
  let parser = WeatherParser()
  
  // MARK: Fields

  @Published var weather: Weather
  /*
  init(weather: Weather) {
    self.weather = weather
  }
   */


}
