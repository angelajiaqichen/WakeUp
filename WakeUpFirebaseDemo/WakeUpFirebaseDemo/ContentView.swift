//
//  ContentView.swift
//  WakeUpFirebaseDemo
//
//  Created by Anagha Srikumar on 10/27/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userRepository = UserRepository()
    var body: some View {
        let userProfiles = userRepository.users
        
        IntroView()
        
        
        NavigationView {
            //Text(userProfiles[0].UUID)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
