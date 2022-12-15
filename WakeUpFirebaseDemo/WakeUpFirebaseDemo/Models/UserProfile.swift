//
//  UserProfile.swift
//  WakeUpFirebaseDemo
//
//  Created by Anagha Srikumar on 12/15/22.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import Firebase

import SwiftUI

struct UserProfile: Identifiable, Decodable {
    var id: String? = UUID().uuidString
    var deviceID: String?
    var name: String?
    var weather: Bool
    var breathing: Bool
    var affirmations: Bool
    var quotes: Bool
    var suggestion: Bool
    var productivity: Bool
  

    enum CodingKeys: String, CodingKey{
        case id
        case deviceID
        case name
        case weather
        case breathing
        case affirmations
        case quotes
        case suggestion
        case productivity
      
    }
    

}










