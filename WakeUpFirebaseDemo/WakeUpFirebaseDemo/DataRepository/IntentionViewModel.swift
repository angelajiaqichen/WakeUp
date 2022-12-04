//
//  IntentionViewModel.swift
//  WakeUpFirebaseDemo
//
//  Created by Rebecca Li on 12/4/22.
//

import Foundation
import FirebaseFirestore


class IntentionViewModel: ObservableObject {
  // Set up properties here
  //private let path: String = "loca(tion_scans"
  @Published var users = [User]()
  private let db = Firestore.firestore()

    
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
                
                let user = User(id: UUID, streak: streak, features: features, intentions: intentions)
                return user
            }
        }
    }
    
    
}

