//
//  DeepBreathView.swift
//  WakeUpFirebaseDemo
//
//  Created by Rebecca Li on 11/6/22.
//

import SwiftUI



struct DeepBreathView: View {
    //var animateCircle: () -> Void
    //@ObservedObject var viewModel = ViewModel()
    @Binding var animationDuration: Double
    @Binding var isMinimized: Bool
    let colors = [
        Color(red: 1.0, green: 0.64314, blue: 0.64314),
        Color(red: 0.59215, green: 0.78039, blue: 1.0),
        Color(red: 0.9333, green: 0.69411, blue: 0.8667)]
    var body: some View {
        VStack{
            Text("Take 5 Deep Breaths to Start Your Day!")
                .foregroundColor(.white)
                .font(.custom(
                    "Avenir",
                    fixedSize: 30))
                .padding(50)
                .multilineTextAlignment(.center)
            Spacer()
            // adapted from https://betterprogramming.pub/create-breathe-apps-animation-in-swift-6c0a10cb928a
            ZStack {
                        ForEach((0...2), id: \.self) {circleSetNumber in
                            ZStack {
                                Circle().fill(LinearGradient(gradient: Gradient(colors: [.purple, .white]), startPoint: .top, endPoint: .bottom))
                                    .frame(width: 150, height: 150)
                                    .offset(y: isMinimized ? 0 : 75)

                                Circle().fill(LinearGradient(gradient: Gradient(colors: [.purple, .white]), startPoint: .bottom, endPoint: .top))
                                    .frame(width: 150, height: 150)
                                    .offset(y: isMinimized ? 0 : -75)
                            }
                            .opacity(0.5)
                            .rotationEffect(.degrees(isMinimized ? 0 : Double(circleSetNumber*60)))
                            .scaleEffect(isMinimized ? 0.2 : 1)
                            .onAppear {
                                withAnimation(.easeInOut.repeatCount(10).speed(0.1)) {
                                     isMinimized.toggle()
                                }
                             }
                        }
                    }
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(LinearGradient(colors: colors,
                                    startPoint: .top,
                                    endPoint: .bottom))
       
    }
}



struct DeepBreathView_Previews: PreviewProvider {
    static var previews: some View {
        DeepBreathView(animationDuration: .constant(4.2),isMinimized: .constant(false))
    }
}
