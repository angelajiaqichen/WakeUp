//
//  UserDemo.swift
//  WakeUpFirebaseDemo
//
//  Created by Anagha Srikumar on 10/27/22.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import Firebase

import SwiftUI

struct User: Decodable {

  let UUID: String
  var streak: Int
  var features: [String] //list of selected features
  var intentions: [String]
  

    enum CodingKeys: String, CodingKey{
        case UUID
        case streak
        case features
        case intentions
      
    }
    
//    
//  static let example = User(UUID: "1092830",streak: 6,features: ["breathing","quotes"],intention1: "Say hello")
//  let database = Database.database().reference()
//  private func updateData() {
//    database.child("users").child("0").setValue(["UUID": "12345",
//                                                "streak": 7,
//                                                "features": ["weather"],
//                                                 "intentions": ["firebase test 1"]])
//  }
  

}










