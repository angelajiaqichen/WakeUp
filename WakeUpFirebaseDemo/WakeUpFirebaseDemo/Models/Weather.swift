//
//  Weather.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/5/22.
//

// code modified from in-class json decoding exercise

//API KEY: uazUjXjhg8fUxYsbgyJhLzLfLNnRvMXQ
//DOCUMENTATION: https://developer.accuweather.com/accuweather-current-conditions-api/apis


import Foundation
//import PlaygroundSupport
//import CoreLocation
//PlaygroundPage.current.needsIndefiniteExecution = true



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

