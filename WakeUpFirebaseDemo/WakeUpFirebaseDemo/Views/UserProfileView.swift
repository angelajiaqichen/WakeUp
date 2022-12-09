//
//  UserProfileView.swift
//  WakeUpFirebaseDemo
//
//  Created by Anagha Srikumar on 12/9/22.
//

import SwiftUI

struct UserProfileView: View {
    let colors = [
        Color(red: 1.0, green: 0.8549, blue: 0.4784),
        Color(red: 1.0, green: 0.717647, blue: 0.7333)]
    var body: some View {
        VStack{
            Spacer()

            IntroView(
                suggestionSelected: .constant(false), weatherSelected: .constant(true),
                quoteSelected: .constant(true),
                productivitySelected: .constant(true),
                breathingSelected: .constant(true),
                affirmationsSelected: .constant(true),
                editOrIntro: .constant("edit"))
            
           
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(LinearGradient(colors: colors,
                                    startPoint: .top,
                                    endPoint: .bottom))
        .ignoresSafeArea()
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
