//
//  ContentView.swift
//  WakeUpFirebaseDemo
//
//  Created by Anagha Srikumar on 10/27/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()

    private let colors: [Color] = [.red,.blue,.green]
    @State var offset: CGFloat = 0
    var body: some View {

        //let userProfiles = userRepository.users
        
      //Text("Hello, world! Welcome to WakeUp")

        VStack{
            TabView {
                TasksView()
                //CalendarView() // delete this line when done with testing calendar
                SplashScreen()
                WeatherView()
                DeepBreathView()
                CalendarView()
                AffirmationsView()
                SuggestionView()
                QuoteView()
                ConquerTheDayView()

                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .ignoresSafeArea()
        }
                
        

    }

}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}


