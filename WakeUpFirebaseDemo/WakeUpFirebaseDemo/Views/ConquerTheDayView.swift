//
//  ConquerTheDayView.swift
//  WakeUpFirebaseDemo
//
//  Created by Rebecca Li on 11/6/22.
//

import SwiftUI

struct ConquerTheDayView: View {
    let colors = [
        Color(red: 0.9882, green: 0.4706, blue: 1.0),
        Color(red: 0.7961, green: 1.0, blue: 0.8784)]
  var body: some View {
      VStack{
          Text("You Are Ready to Conquer the Day!")
              .foregroundColor(.white)
              .font(.custom(
                  "Avenir",
                  fixedSize: 40))
              .multilineTextAlignment(.center)
          .padding(50)
      }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
      .background(LinearGradient(colors: colors,
                                  startPoint: .top,
                                  endPoint: .bottom))
      

  }
}

struct ConquerTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        ConquerTheDayView()
    }
}
