//
//  OnboardView.swift
//  WakeUpFirebaseDemo
//
//  Created by Anagha Srikumar on 11/14/22.
//

import SwiftUI

struct OnboardView: View {
    let colors = [
        Color(red: 1.0, green: 0.8549, blue: 0.4784),
        Color(red: 1.0, green: 0.717647, blue: 0.7333)]
    let rectColor = Color(red: 0.784313, green: 0.63529, blue: 0.784313)
    @State private var showingAlert = false
    var body: some View {
        VStack{
            HStack{
                Spacer()
                RoundedRectangle(cornerRadius: 25.0, style: .circular)
                    .fill(rectColor)
                .frame(width: 320, height: 320)
                
                .overlay(
                    Text("WakeUp is a wellness app to help you alleviate the dread associated with waking up. Our app features different exercises that you can perform in the morning to alleviate anxiety and panic.").foregroundColor(.white).multilineTextAlignment(.center)).padding()
                Spacer()
            }
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(LinearGradient(colors: colors,
                                        startPoint: .top,
                                        endPoint: .bottom))
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}
