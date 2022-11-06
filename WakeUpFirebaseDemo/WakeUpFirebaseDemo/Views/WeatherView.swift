//
//  WeatherView.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/6/22.
//

import SwiftUI

struct WeatherView: View {
  var JSONDATA: Weather
  
  
  let task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
   guard let data = data else {
    print("Error: No data to decode")
    return
   }

   // Decode the JSON here
   guard let JSONDATA = try? JSONDecoder().decode(Weather.self, from: data) else {
    print("Error: Couldn't decode data into a result")
    return
   }
  }.resume()
  
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      
      Text("Current Temp (F):")
      /*
      if JSONDATA != nil {
        Text(JSONDATA.weatherDetails.imperial.value)
      }
       */
      Text("Current Weather Type:")
      //Text(JSONDATA.weatherType)
       
    }
}

