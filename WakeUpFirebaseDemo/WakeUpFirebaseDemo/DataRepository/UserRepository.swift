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
  @Published var date: String = ""
  var viewModel = ViewModel()
    

  init() {
      self.get()
      self.getUserProfileInfo()     
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
    
    func getUserProfileInfo(){
        db.collection("user-profiles")
          .addSnapshotListener { querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
              return
            }
              
              self.users = querySnapshot?.documents.compactMap { document in
                try? document.data(as: User.self)
              } ?? []
  
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
    

    
    
}
