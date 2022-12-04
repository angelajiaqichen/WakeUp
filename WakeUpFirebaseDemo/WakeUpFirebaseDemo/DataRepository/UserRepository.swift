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
  
//
//  func updateUser(user:User, UUID: String, streak: Int, features: [String], intention1: String, intention2: String, intention3: String) {
//    let curr_user = ref.child("users").child(user.UUID)
//    curr_user.child("UserID").setValue(UUID)
//    curr_user.child("features").setValue(features)
//    curr_user.child("intention1").setValue(intention1)
//    curr_user.child("intention2").setValue(intention2)
//    curr_user.child("intention3").setValue(intention3)
//  }
  
  init() {
    get()
    //set()
  }
    /*
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
  */

    func get() {
        
    print("hello world")
    // Complete this function
    db.collection("users")
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
    func updateIntentionData(intentions: [String]) {
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: ["UUID": "12345",
                                                  "streak": 7,
                                                  "features": ["weather"],
                                                   "intentions": intentions]
        ) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }

        
//        db.collection("users").doc("12345").set({
//            "streak": 7,
//            "features": ["weather"],
//             "intentions": ["firebase test 1"]]
//        })
    
//
//      db.child("users").child("0").setValue(["UUID": "12345",
//                                                  "streak": 7,
//                                                  "features": ["weather"],
//                                                   "intentions": ["firebase test 1"]])
    }
    
    func fetchData() {
        db.collection("users").addSnapshotListener(){ (QuerySnapshot, error) in
            guard let documents = QuerySnapshot?.documents else {
                print("No documents")
                return
            }
            self.users = documents.map{(QueryDocumentSnapshot)->User in
                let data = QueryDocumentSnapshot.data()
                let UUID = data["UUID"] as? String ?? ""
                let streak = data["streak"] as? Int ?? 0
                let features = data["features"] as? [String] ?? []
                let intentions = data["intentions"] as? [String] ?? []
                
                let user = User(UUID: UUID, streak: streak, features: features, intentions: intentions)
                return user
            }
        }
    }
    
    
}
