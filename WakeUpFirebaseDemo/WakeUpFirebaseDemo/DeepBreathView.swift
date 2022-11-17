//
//  DeepBreathView.swift
//  WakeUpFirebaseDemo
//
//  Created by Rebecca Li on 11/6/22.
//

import SwiftUI

struct DeepBreathView: View {
    let colors = [
        Color(red: 1.0, green: 0.64314, blue: 0.64314),
        Color(red: 0.59215, green: 0.78039, blue: 1.0),
        Color(red: 0.9333, green: 0.69411, blue: 0.8667)]
    var body: some View {
        VStack{
            Circle()
                .fill(colors[2])
                .padding(3)
                .frame(width:450, height:450)
                .overlay(
                    Text("Take 5 Deep Breaths to Start Your Day!")
                        .foregroundColor(.white)
                        .font(.custom(
                            "Avenir",
                            fixedSize: 40))
                        .padding(50)
                        .multilineTextAlignment(.center)
            )
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(LinearGradient(colors: colors,
                                    startPoint: .top,
                                    endPoint: .bottom))
       
    }
}

struct DeepBreathView_Previews: PreviewProvider {
    static var previews: some View {
        DeepBreathView()
    }
}
