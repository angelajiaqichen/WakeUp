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
      Text("Hello, world! Welcome to WakeUp")
      //WeatherView(JSONDATA: <#Weather#>)
      /*
        let userProfiles = userRepository.users
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world! Welcome to WakeUp")
        }
        .padding()
        
        NavigationView {
            //Text(userProfiles[0].UUID)
        }
       */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
