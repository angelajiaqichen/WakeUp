//
//  ContentView.swift
//  WakeUpFirebaseDemo
//
//  Created by Anagha Srikumar on 10/27/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()

    @ObservedObject var userRepository = UserRepository()

    @State private var isMinimized = true
    @State private var animationDuration = 0.5


    private let colors: [Color] = [.red,.blue,.green]
    // set the "selected" vars all to true for testing purposes. do not merge this
    @State private var weatherSelected = true
    @State private var suggestionSelected = true
    @State private var quoteSelected = true
    @State private var productivitySelected = true
    @State private var breathingSelected = true
    @State private var affirmationsSelected = true
    
    var body: some View {
      
        VStack{
            TabView {

//                let userProfiles = userRepository.updateIntentionData(intentions: ["你好","hihihihih"] )

                SplashScreen()
                //IntentionsView()
                EventsView()
                TasksView()
                
                IntroView(
                    suggestionSelected: $suggestionSelected, weatherSelected: $weatherSelected,
                quoteSelected: $quoteSelected,
                productivitySelected: $productivitySelected,
                          breathingSelected: $breathingSelected,
                    affirmationsSelected: $affirmationsSelected)
                
                if weatherSelected{
                    WeatherView()
                }
//                if breathingSelected{
//
//                    DeepBreathView(animationDuration: $animationDuration, isMinimized: $isMinimized)
//                }
//                if affirmationsSelected{
//                    AffirmationsView()
//                }
//
//                if suggestionSelected{
//                    SuggestionView()
//                }
//                if quoteSelected{
//                    QuoteView()
//                }
                SummaryView()
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


