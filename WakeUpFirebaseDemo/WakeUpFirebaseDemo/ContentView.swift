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

    private let colors: [Color] = [.red,.blue,.green]
    @State private var weatherSelected = false
    @State private var suggestionSelected = false
    @State private var quoteSelected = false
    @State private var productivitySelected = false
    @State private var breathingSelected = false
    @State private var affirmationsSelected = false
    
    var body: some View {
      
        VStack{
            TabView {
//                let userProfiles = userRepository.updateIntentionData(intentions: ["你好","hihihihih"] )
                SplashScreen()
                IntentionsView()
                
                IntroView(
                    suggestionSelected: $suggestionSelected, weatherSelected: $weatherSelected,
                quoteSelected: $quoteSelected,
                productivitySelected: $productivitySelected,
                          breathingSelected: $breathingSelected,
                affirmationsSelected: $affirmationsSelected)
                
                if weatherSelected{
                    WeatherView()
                }
                if breathingSelected{
                    DeepBreathView()
                }
                if affirmationsSelected{
                    AffirmationsView()
                }
                
                if suggestionSelected{
                    SuggestionView()
                }
                if quoteSelected{
                    QuoteView()
                }
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


