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
    
     //alamofire fetching weather 
     print("Fetching weather...")
     AF.request(self.urlString).responseDecodable(of: Weather.self) { response in
     guard let weather: Weather = response.value else { return }
     completionHandler(weather)
     }
     print("Fetched weather...")
     
    /*
    //jsondecoder fetching weather
    let task = URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
      guard let data = data else {
        print("Error: No data to decode")
        return
      }
      
      // Decode the JSON here
      guard let weather = try? JSONDecoder().decode(Weather.self, from: data) else {
        print("Error: Couldn't decode data into a result")
        return
      }
    }
    task.resume()
  }
     */

}


