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


    private let colors = [
        Color(red: 1.0, green: 0.8549, blue: 0.4784),
        Color(red: 1.0, green: 0.717647, blue: 0.7333)]
    @State private var weatherSelected = false
    @State private var suggestionSelected = false
    @State private var quoteSelected = false
    @State private var productivitySelected = false
    @State private var breathingSelected = false
    @State private var affirmationsSelected = false
    @State private var signup_login_selection: String? = nil
    
    var body: some View {    
            NavigationView{
                    VStack{
                        Spacer()
                        Text("WakeUp")
                            .font(.custom(
                                    "Avenir",
                                    fixedSize: 40))
                            .foregroundColor(.white)
                        Spacer()
                        NavigationLink(destination:
                                        TabView {
                            IntroView(
                                suggestionSelected: $suggestionSelected, weatherSelected: $weatherSelected,
                                quoteSelected: $quoteSelected,
                                productivitySelected: $productivitySelected,
                                breathingSelected: $breathingSelected,
                                affirmationsSelected: $affirmationsSelected, editOrIntro: .constant("intro"))
                            if weatherSelected{
                                WeatherView()
                            }
                            if breathingSelected{
                                
                                DeepBreathView(animationDuration: $animationDuration, isMinimized: $isMinimized)
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
                            
                            if productivitySelected {
                                IntentionsView()
                                SummaryView()
                            }
                            ConquerTheDayView()
                            
                        } .tabViewStyle(PageTabViewStyle())
                            .ignoresSafeArea()
                        , tag: "signup", selection: $signup_login_selection){EmptyView()}
                        
                        NavigationLink(destination:
                            TabView {
                            IntroView(
                                suggestionSelected: $suggestionSelected, weatherSelected: $weatherSelected,
                                quoteSelected: $quoteSelected,
                                productivitySelected: $productivitySelected,
                                breathingSelected: $breathingSelected,
                                affirmationsSelected: $affirmationsSelected, editOrIntro: .constant("edit"))
                            WeatherView()
                            DeepBreathView(animationDuration: $animationDuration, isMinimized: $isMinimized)
                            AffirmationsView()
                            SuggestionView()
                            QuoteView()
                            IntentionsView()
                            SummaryView()
                            ConquerTheDayView()
                        }.tabViewStyle(PageTabViewStyle())
                            .ignoresSafeArea()
                        , tag: "login", selection: $signup_login_selection){EmptyView()}
                        
                        
                        
                        Button(action:{signup_login_selection = "signup"}){
                            RoundedRectangle(cornerRadius: 25.0, style: .circular)
                                .foregroundColor(colors[1])
                                .overlay(
                                    Text("Sign Up").foregroundColor(.white).bold()).frame(width: 150, height: 50)
                        }
                        
                        Button(action:{signup_login_selection = "login"}){
                            
                            RoundedRectangle(cornerRadius: 25.0, style: .circular)
                                .foregroundColor(colors[1])
                                .overlay(
                                    Text("Log In").foregroundColor(.white).bold()).frame(width: 150, height: 50)
                        }
                        Spacer()
                        
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(LinearGradient(colors: colors,
                                                startPoint: .top,
                                                endPoint: .bottom))
                    
                    }
                    
            }
                
    }








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}


