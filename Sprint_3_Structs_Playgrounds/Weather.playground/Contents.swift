// code modified from in-class json decoding exercise

//API KEY: uazUjXjhg8fUxYsbgyJhLzLfLNnRvMXQ
//DOCUMENTATION: https://developer.accuweather.com/accuweather-current-conditions-api/apis


import Foundation
import PlaygroundSupport
//import CoreLocation
PlaygroundPage.current.needsIndefiniteExecution = true


let url = "http://dataservice.accuweather.com/currentconditions/v1/2627601?apikey=uazUjXjhg8fUxYsbgyJhLzLfLNnRvMXQ"

struct Weather: Decodable {
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
struct WeatherDetailsWrapper: Decodable {
  let weatherDetails: WeatherDetails
  let weatherType: String

  enum CodingKeys: String, CodingKey{
   case weatherDetails = "Temperature"
   case weatherType = "WeatherText"
  }
}

struct WeatherDetails: Decodable{
  let imperial: Imperial
 enum CodingKeys: String, CodingKey{
   case imperial = "Imperial"
 }
}

 struct Imperial: Decodable{
  let value: Double
  enum CodingKeys: String, CodingKey{
   case value = "Value"
  }
 }





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


 // Output if everything is working right

 print("Forecast:")
 print("Current Temp: \(JSONDATA.weatherDetails.imperial.value) F")
 print("Current Weather Type: \(JSONDATA.weatherType)")

}

task.resume()



/* SAMPLE JSON
 [
 {
 "LocalObservationDateTime": "2022-10-27T15:38:00-04:00",
 "EpochTime": 1666899480,
 "WeatherText": "Sunny",
 "WeatherIcon": 1,
 "HasPrecipitation": false,
 "PrecipitationType": null,
 "IsDayTime": true,
 "Temperature": {
 "Metric": {
 "Value": 12.5,
 "Unit": "C",
 "UnitType": 17
 },
 "Imperial": {
 "Value": 54,
 "Unit": "F",
 "UnitType": 18
 }
 },
 "MobileLink": "http://www.accuweather.com/en/us/squirrel-hill-north-pa/15217/current-weather/2627601?lang=en-us",
 "Link": "http://www.accuweather.com/en/us/squirrel-hill-north-pa/15217/current-weather/2627601?lang=en-us"
 }
 ]
 */
