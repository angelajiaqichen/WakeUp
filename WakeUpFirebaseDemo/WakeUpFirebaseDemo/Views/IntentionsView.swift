//
//  IntentionsView.swift
//  WakeUpFirebaseDemo
//
//  Created by Rebecca Li on 11/28/22.
//

import Foundation
import SwiftUI


struct IntentionsView: View {
 
    @State private var intention1: String = ""
    @State private var intention2: String = ""
    @State private var intention3: String = ""
    @State private var secondIntention = false
    @State private var thirdIntention = false
    @ObservedObject var userRepository = UserRepository()
    
  let colors = [
      Color(red: 1.0, green: 0.8549, blue: 0.4784),
      Color(red: 1.0, green: 0.717647, blue: 0.7333)]
  
    var body: some View {
        VStack {
          Spacer()
          Text("Intentions")
                .foregroundColor(.white)
                .font(.custom(
                        "Avenir",
                        fixedSize: 50))
                .multilineTextAlignment(.center)
          Spacer()
            TextField("Please type your first intention", text: $intention1)
            .foregroundColor(.white)
            .font(.custom(
                    "Avenir",
                    fixedSize: 20))
            .multilineTextAlignment(.center)
            TextField("Please type your second intention", text: $intention2)
            .foregroundColor(.white)
            .font(.custom(
                    "Avenir",
                    fixedSize: 20))
            .multilineTextAlignment(.center)
            TextField("Please type your third intention", text: $intention3)
            .foregroundColor(.white)
            .font(.custom(
                    "Avenir",
                    fixedSize: 20))
            .multilineTextAlignment(.center)
            .onSubmit{
                userRepository.updateIntentionData(intentions: [intention1,intention2,intention3] )
//                userRepository.reviewIntentions()
            }
//          Button("Add the second Intention") {
//                          secondIntention.toggle()
//                      }
//
//                      if secondIntention {
//                        TextField("Please type your second intention of the day", text: $intention2)
//                          .foregroundColor(.white)
//                          .font(.custom(
//                                  "Avenir",
//                                  fixedSize: 20))
//                          .multilineTextAlignment(.center)
//                      }
//          Button("Add the third Intention") {
//                          thirdIntention.toggle()
//                      }
//
//                      if thirdIntention {
//                        TextField("Please type your third intention of the day", text: $intention3)
//                          .foregroundColor(.white)
//                          .font(.custom(
//                                  "Avenir",
//                                  fixedSize: 20))
//                          .multilineTextAlignment(.center)
//                      }
//        Button("Submit")
//        SecureField("Password", text: $password)
//                    .onSubmit {
//                        print("Authenticating…")
//                    }
//          userRepository.updateIntentionData(intentions: ["你好","hihihihih"] )
          Spacer()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(LinearGradient(colors: colors,
                                    startPoint: .top,
                                    endPoint: .bottom))
    }
}
