//
//  SplashScreen.swift
//  WakeUpFirebaseDemo
//
//  Created by Anagha Srikumar on 11/9/22.
//

import SwiftUI

struct SplashScreen: View {
    let colors = [
        Color(red: 1.0, green: 0.8549, blue: 0.4784),
        Color(red: 1.0, green: 0.717647, blue: 0.7333)]
    var body: some View {
        VStack{
            Spacer()
            Text("WakeUp")
                .font(.custom(
                        "Avenir",
                        fixedSize: 40))
                .foregroundColor(.white)
            Spacer()
            Text("Swipe to Start Your Day")
                .foregroundColor(.white)
                .font(.custom(
                        "Avenir",
                        fixedSize: 20))
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(LinearGradient(colors: colors,
                                    startPoint: .top,
                                    endPoint: .bottom))
        
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
