//
//  DeepBreathView.swift
//  WakeUpFirebaseDemo
//
//  Created by Rebecca Li on 11/6/22.
//

import SwiftUI

struct DeepBreathView: View {
    var body: some View {
        Text("Take 5 Deep Breaths to Start Your Day!")
        .font(.system(size: 48))
        .padding(50)
        .background(
            Image("DeepBreath-Background")
                .resizable()
        )
    }
}

struct DeepBreathView_Previews: PreviewProvider {
    static var previews: some View {
        DeepBreathView()
    }
}
