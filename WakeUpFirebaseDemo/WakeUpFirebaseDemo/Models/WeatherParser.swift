//
//  WeatherParser.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/6/22.
//

import Foundation
import Alamofire

class Parser {

  let urlString = "https://api.github.com/search/repositories?q=language:swift&sort=stars&order=desc"
  //var urlString: String
  
  //init() {
      //self.urlString = "https://api.github.com/search/repositories?q=language:swift&sort=stars&order=desc"
    //}
  

  func fetchRepositories(completionHandler: @escaping ([Repository]) -> Void) {
    AF.request(self.urlString).responseDecodable(of: Repositories.self) { (response) in
      guard let repositories: Repositories = response.value else { return }
      completionHandler(repositories.items)
    }
  }

}

/*

typealias JSONDictionary = [String: AnyObject]

class WeatherParser {
  func parseDictionary(_ data: Data?) -> Result? {
    if let data = data,
      let json = try? JSONDecoder().decode(Result.self, from: data) {
        return json
      }  else {
        return nil
    }
  }
    
 
 
  /*
  func weatherFromSearchResponse(_ data: Data?) -> [Repository]? {
    guard let result = parseDictionary(data) else {
      print("Error: couldn't parse result from data")
      return nil
    }
    
    return result.repos
  }
   */
  
}
*/
