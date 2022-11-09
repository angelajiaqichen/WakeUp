//
//  Weather.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/5/22.
//

//API KEY: uazUjXjhg8fUxYsbgyJhLzLfLNnRvMXQ
//DOCUMENTATION: https://developer.accuweather.com/accuweather-current-conditions-api/apis



import Foundation

// ACCUWEATHER

struct Weather: Codable {
  let weatherDetails: WeatherDetails
  let weatherType: String
  
 init(from decoder : Decoder) throws {
     //unkeyed because we are getting an array as container
     var unkeyedContainer = try decoder.unkeyedContainer()
     let weatherDetailsWrapper = try unkeyedContainer.decode(WeatherDetailsWrapper.self)

     weatherDetails = weatherDetailsWrapper.weatherDetails
     weatherType = weatherDetailsWrapper.weatherType
   }

}

//use wrappers to handle the outer dictionary
struct WeatherDetailsWrapper: Codable {
  let weatherDetails: WeatherDetails
  let weatherType: String

  enum CodingKeys: String, CodingKey{
   case weatherDetails = "Temperature"
   case weatherType = "WeatherText"
  }
}

struct WeatherDetails: Codable{
  let imperial: Imperial
 enum CodingKeys: String, CodingKey{
   case imperial = "Imperial"
 }
}

 struct Imperial: Codable{
  let value: Double
  enum CodingKeys: String, CodingKey{
   case value = "Value"
  }
 }



/*
//OpenWeather: http://api.openweathermap.org/data/2.5/weather?lat=40.443229&lon=-79.944137&APPID=ad83d72d867862de7a87faec3178ffa6
struct Temperature: Codable {
  let temp: Float

  enum CodingKeys : String, CodingKey {
    case temp
  }
}

struct WeatherType: Codable {
  let type: String
  
  enum CodingKeys : String, CodingKey {
    case type = "main"
  }
}

struct Weather: Codable { //this is the wrapper
  let temperature: Temperature
  let weatherType: WeatherType
  
  enum CodingKeys : String, CodingKey {
    case temperature = "main"
    case weatherType = "weather"
  }
}
*/
