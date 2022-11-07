//
//  WeatherParser.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/6/22.
//

import Foundation
import Alamofire

class WeatherParser {

  let urlString = "http://dataservice.accuweather.com/currentconditions/v1/2627601?apikey=uazUjXjhg8fUxYsbgyJhLzLfLNnRvMXQ"

  

  func fetchWeather(completionHandler: @escaping (Weather) -> Void) {
    print("Fetching weather...")
    AF.request(self.urlString).responseDecodable(of: Weather.self) { response in
      guard let weather: Weather = response.value else { return }
      completionHandler(weather)
    }
    print("Fetched weather...")
    
    
  }

}


