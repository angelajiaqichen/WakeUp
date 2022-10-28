//
//  UserDemo.swift
//  WakeUpFirebaseDemo
//
//  Created by Anagha Srikumar on 10/27/22.
//

import Foundation
import FirebaseCore
import FirebaseFirestore


import SwiftUI


struct User {//: Codable {
  let UUID: String
  let streak: Int
  let notify: Bool
  let features: [String] //list of selected features

  /*
    enum CodingKeys: String, CodingKey{
        case UUID
        case streak
        case notify
        case features
    }
    */
  init(UUID: String, streak: Int, notify: Bool, features: [String]) {
      self.UUID = UUID
      self.streak = streak
      self.notify = notify
      self.features = features
    }
    
    static let example = User(UUID: "1092830", streak: 6, notify: true,features: ["breathing","quotes"])


}












