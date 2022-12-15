//
//  UserRepository.swift
//  WakeUpFirebaseDemo
//
//  Created by Anagha Srikumar on 10/27/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine
import UIKit




class UserRepository: ObservableObject {

  
  private let db = Firestore.firestore()

  @Published var users: [User] = []
  @Published var userprofiles: [UserProfile] = []
  @Published var date: String = ""
  var viewModel = ViewModel()
    

  init() {
      self.get()
      //self.getUserProfileInfo()     
  }


    func get() {
    db.collection("users")
      .addSnapshotListener { querySnapshot, error in
        if let error = error {
            print("Error getting documents: \(error)")
          return
        }
          
          self.users = querySnapshot?.documents.compactMap { document in
            try? document.data(as: User.self)
          } ?? []
          let mytime = Date()
          let format = DateFormatter()
          format.dateFormat = "dd-MM-yyyy"
          self.date = format.string(from: mytime)
      }


    }
   
  
    
    func updateIntentionData(intentions: [String]) {
        var ref: DocumentReference? = nil
        let mytime = Date()
        let format = DateFormatter()
        format.dateFormat = "dd-MM-yyyy"
        let id = UUID().uuidString
        let deviceID = UIDevice.current.identifierForVendor?.uuidString
        let date = format.string(from: mytime)
        let quote = viewModel.quote.text
        let affirmations = [viewModel.affirmations[0].text,
                           viewModel.affirmations[1].text,
                           viewModel.affirmations[2].text,
                           viewModel.affirmations[3].text,
                           viewModel.affirmations[4].text]
        let suggestion = viewModel.suggestion.text
        let currUser = User(id: id,
                            deviceID:deviceID,
                            date:date,
                            intentions:intentions,
                            quote:quote,
                            affirmations:affirmations,
                            suggestion:suggestion)
        self.users.append(currUser)
        ref = db.collection("users").addDocument(data: ["id": id,
                                                        "deviceID": deviceID,
                                                        "date": date,
                                                        "intentions": intentions,
                                                        "quote": quote,
                                                        "affirmations": affirmations,
                                                        "suggestion": suggestion
                                                        ]
        ) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        
       
        print(self.users)
    }
    
    func createNewUserProfile(name: String, weather: Bool, breathing: Bool, productivity: Bool, suggestion: Bool, quotes: Bool, affirmations: Bool) {
        var ref: DocumentReference? = nil
        let deviceID = UIDevice.current.identifierForVendor?.uuidString
        let id = UUID().uuidString

        /*
         case deviceID
         case name
         case weather
         case breathing
         case affirmations
         case quotes
         case suggestion
         case productivity
         */
        let curr_profile = UserProfile(
                            id: id,
                            deviceID:deviceID,
                            name:name,
                            weather:weather,
                            breathing: breathing,
                            affirmations: affirmations,
                            quotes:quotes,
                            suggestion:suggestion,
                            productivity:productivity)
        
        self.userprofiles.append(curr_profile)
        ref = db.collection("user-profiles").addDocument(data: [
                                                        "id": id,
                                                        "deviceID": deviceID,
                                                        "name": name,
                                                        "weather": weather,
                                                        "quote": quotes,
                                                        "affirmations": affirmations,
                                                        "suggestion": suggestion,
                                                        "productivity": productivity,
                                                        "breathing": breathing
                                                        ]
        ) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
                
            }
        }
        
       
        print(self.userprofiles)
    }
    
    func retrieveUserProfile() async -> Any {
        var curr_profile :  [String : Any?] = [:]
        
        do {
          // Use the `await` keyword to wait for the query to finish executing
            let querySnapshot = try await db.collection("user-profiles")
            .whereField("deviceID", isEqualTo: UIDevice.current.identifierForVendor?.uuidString)
            .getDocuments()

          if (querySnapshot.documents.isEmpty) {
              curr_profile =  await [
                  "deviceID": UIDevice.current.identifierForVendor?.uuidString,
                  "name": false,
                  "weather": true,
                  "quote": true,
                  "affirmations": true,
                  "suggestion": true,
                  "productivity": true,
                  "breathing": true
              ]
          } else {
            for document in querySnapshot.documents {
              print("\(document.documentID) => \(document.data())")
                curr_profile = document.data()
            }
              
          }
        } catch {
          // Handle any errors that are thrown by the `getDocuments()` method
          print("An error occurred while getting the documents: \(error)")
        }
       
        print(curr_profile)
        return curr_profile
        
       /*
        db.collection("user-profiles").whereField("deviceID", isEqualTo: UIDevice.current.identifierForVendor?.uuidString)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        curr_profile = document.data()
                    }
                }
        }
        print(curr_profile)
        return curr_profile
        
        */
    }
    

    
    func isExistingUser() async -> Bool {
      var exists = false

      do {
        // Use the `await` keyword to wait for the query to finish executing
          let querySnapshot = try await db.collection("user-profiles")
          .whereField("deviceID", isEqualTo: UIDevice.current.identifierForVendor?.uuidString)
          .getDocuments()

        if (querySnapshot.documents.isEmpty) {
          exists = false
        } else {
          for document in querySnapshot.documents {
            print("\(document.documentID) => \(document.data())")
          }
          exists = true
        }
      } catch {
        // Handle any errors that are thrown by the `getDocuments()` method
        print("An error occurred while getting the documents: \(error)")
      }
     
    print(self.userprofiles)
      return exists
    }


    
 

    

    
    
}
