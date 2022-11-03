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




class UserRepository: ObservableObject {
  // Set up properties here
  //private let path: String = "location_scans"
  private let db = Firestore.firestore()

  @Published var users: [User] = []
  //private var cancellables: Set<AnyCancellable> = []
  
  
  init() {
    get()
    set()
  }
    
    func set(){
        
        db.collection("user-profiles").document("testUser").setData([
            "UUID": "1238092384",
            "notify": true,
            "streak": 10,
            "features": ["quotes", "breathing"]
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }

    func get() {
        
    print("hello world")
    // Complete this function
    db.collection("user-profiles")
      .addSnapshotListener { querySnapshot, error in
        if let error = error {
            print("Error getting documents: \(error)")
          return
        }

          for document in querySnapshot!.documents {
                      print("\(document.documentID) => \(document.data())")
          }
          
          self.users = querySnapshot?.documents.compactMap { document in
            try? document.data(as: User.self)
          } ?? []
      }

    //debugging
    for usr in self.users {
       print(String(usr.UUID)) // check to see if data was loaded
     }
    
    print("hello world 2")


    }
    
}
