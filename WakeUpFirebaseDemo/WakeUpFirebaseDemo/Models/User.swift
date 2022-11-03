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


struct User: Decodable {
  let UUID: String
  var streak: Int
  var notify: Bool
  var features: [String] //list of selected features

    enum CodingKeys: String, CodingKey{
        case UUID
        case streak
        case notify
        case features
    }
    
    
    static let example = User(UUID: "1092830",streak: 6, notify: true,features: ["breathing","quotes"])

}










