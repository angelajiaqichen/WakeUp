//
//  IntroView.swift
//  WakeUpFirebaseDemo
//
//  Created by Rebecca Li on 11/8/22.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
      Spacer()
      Text("WakeUp").font(.system(size: 36))
      Text("Welcome!").font(.system(size: 20))
      Text("Select the features you would like in your routine")
      
      
      HStack(alignment: .center) {
        Image("Alarm")
        .padding()
        Image("Weather")
         .fontWeight(.thin)
      }
      .padding()
      
      HStack(alignment: .center) {
        Spacer()
        Button(action: {}) {
          Text("Alarm")
        }
        Spacer()
        Button(action: {}) {
          Text("Weather")
        }
        Spacer()
      }
      .padding()
    
      
      HStack(alignment: .center) {
        Image("Quote")
        .padding()
        Image("To-do")
         .fontWeight(.thin)
      }
      .padding()
      
      HStack(alignment: .center) {
        Spacer()
        Button(action: {}) {
          Text("Quote")
        }
        Spacer()
        Button(action: {}) {
          Text("To-do")
        }
        Spacer()
      }
      .padding()
     
      
      
      HStack(alignment: .center) {
        Image("Deep breaths")
        .padding()
        Image("Affirmations")
         .fontWeight(.thin)
      }
      .padding()
      
      HStack(alignment: .center) {
        Spacer()
        Button(action: {}) {
          Text("Deep breaths")
        }
        Spacer()
        Button(action: {}) {
          Text("Affirmations")
        }
        Spacer()
      }
      .padding()
    
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
