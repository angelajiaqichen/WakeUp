//
//  IntroView.swift
//  WakeUpFirebaseDemo
//
//  Created by Rebecca Li on 11/8/22.
//

import SwiftUI



struct IntroView: View {
    let colors = [
        Color(red: 1.0, green: 0.8549, blue: 0.4784),
        Color(red: 1.0, green: 0.717647, blue: 0.7333)]
    let buttonColor = Color(red: 0.784313, green: 0.63529, blue: 0.784313)

    @Binding var suggestionSelected: Bool
    @Binding var weatherSelected: Bool
    @Binding var quoteSelected: Bool
    @Binding var productivitySelected: Bool
    @Binding var breathingSelected: Bool
    @Binding var affirmationsSelected: Bool
    @Binding var editOrIntro: String
    
    @State private var showWeatherPopUp = false
    @State private var showAffirmationPopUp = false
    @State private var showQuotePopUp = false
    @State private var showSuggestionPopUp = false
    @State private var showBreathingPopUp = false
    @State private var showProductivityPopUp = false
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                if (self.editOrIntro=="intro"){
                    Text("**WakeUp**").font(.system(size: 36))
                        .foregroundColor(.white)
                    Text("Select the features you would like in your routine")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                else if (self.editOrIntro == "edit"){
                    Text("**Welcome, User**").font(.system(size: 36))
                        .foregroundColor(.white)
                    Text("Edit your routine below")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                
                HStack(alignment: .center) {
                    Spacer()
                    VStack{
                        Button(action: {self.weatherSelected.toggle()}) {
                            VStack{
                                RoundedRectangle(cornerRadius: 25.0, style: .circular)
                                    .fill(!weatherSelected ? buttonColor: .purple)
                                    .overlay(
                                        Image("Weather")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 100)).frame(width: 150, height: 150)
                            }
                            
                        }
                        Button(action: {
                            withAnimation(.linear(duration: 1)){
                                self.showWeatherPopUp = true
                            }
                        }){
                            HStack{
                                Text("Weather").foregroundColor(.purple)
                                Image(systemName: "info.circle").foregroundColor(.purple)
                            }
                        }
                    }
                    Spacer()
                    VStack{
                        Button(action: {self.breathingSelected.toggle()}) {
                            VStack{
                                RoundedRectangle(cornerRadius: 25.0, style: .circular)
                                    .fill(!breathingSelected ? buttonColor: .purple)
                                    .overlay(
                                        Image("Deep breaths")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 100)).frame(width: 150, height: 150)
                            }
                        }
                                Button(action: {
                                    withAnimation(.linear(duration: 1)){
                                        self.showBreathingPopUp = true
                                    }
                                }){
                                    HStack{
                                        Text("Breathing").foregroundColor(.purple)
                                        Image(systemName: "info.circle").foregroundColor(.purple)
                                    }
                                }
                            
                        
                    }
                    Spacer()
                }
                
                
                
                
                HStack(alignment: .center) {
                    Spacer()
                    VStack{
                        Button(action: {self.productivitySelected.toggle()}) {
                            VStack{
                                RoundedRectangle(cornerRadius: 25.0, style: .circular)
                                    .fill(!productivitySelected ? buttonColor: .purple)
                                    .overlay(
                                        Image("To-do")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 100)).frame(width: 150, height: 150)
                            }
                        }
                                
                                
                                Button(action: {
                                    withAnimation(.linear(duration: 1)){
                                        self.showProductivityPopUp = true
                                    }
                                }){
                                    HStack{
                                        Text("Productivity").foregroundColor(.purple)
                                        Image(systemName: "info.circle").foregroundColor(.purple)
                                    }
                                }
                    }
                    Spacer()
                    VStack{
                        Button(action: {self.suggestionSelected.toggle()}) {
                            VStack{
                                RoundedRectangle(cornerRadius: 25.0, style: .circular)
                                    .fill(!suggestionSelected ? buttonColor: .purple)
                                    .overlay(
                                        Image("Suggestion")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 100)).frame(width: 150, height: 150)
                            }
                        }
                                
                                Button(action: {
                                    withAnimation(.linear(duration: 1)){
                                        self.showSuggestionPopUp = true
                                    }
                                }){
                                    HStack{
                                        Text("Suggested Activity").foregroundColor(.purple)
                                        Image(systemName: "info.circle").foregroundColor(.purple)
                                    }
                                }
                            
                        
                    }
                    Spacer()
                    
                }
                
                
                
                
                HStack(alignment: .center) {
                    Spacer()
                    
                    VStack{
                        Button(action: {self.quoteSelected.toggle()}) {
                            VStack{
                                RoundedRectangle(cornerRadius: 25.0, style: .circular)
                                    .fill(!quoteSelected ? buttonColor: .purple)
                                    .overlay(
                                        Image("Quote")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 100)).frame(width: 150, height: 150)
                            }
                        }
                                Button(action: {
                                    withAnimation(.linear(duration: 1)){
                                        self.showQuotePopUp = true
                                    }
                                }){
                                    HStack{
                                        Text("Quote of the Day").foregroundColor(.purple)
                                        Image(systemName: "info.circle").foregroundColor(.purple)
                                    }
                                }
                            
                        
                    }
                    Spacer()
                    VStack{
                        Button(action: {self.affirmationsSelected.toggle()}) {
                            VStack{
                                RoundedRectangle(cornerRadius: 25.0, style: .circular)
                                    .fill(!affirmationsSelected ? buttonColor: .purple)
                                    .overlay(
                                        Image("Affirmations")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 100)).frame(width: 150, height: 150)
                            }
                        }
                                Button(action: {
                                    withAnimation(.linear(duration: 1)){
                                        self.showAffirmationPopUp = true
                                    }
                                }){
                                    HStack{
                                        Text("Affirmations").foregroundColor(.purple)
                                        Image(systemName: "info.circle").foregroundColor(.purple)
                                    }
                                }
                            
                        
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(RadialGradient(colors: colors, center: .center, startRadius: 0, endRadius: 350))
            
            if $showWeatherPopUp.wrappedValue {
                popUpView(button: "Weather")
                  }
            if $showBreathingPopUp.wrappedValue {
                popUpView(button: "Breathing")
                  }
            if $showProductivityPopUp.wrappedValue {
                popUpView(button: "Productivity")
                  }
            if $showQuotePopUp.wrappedValue {
                popUpView(button: "Quotes")
                  }
            if $showSuggestionPopUp.wrappedValue{
                popUpView(button: "Activity")
            }
            if $showAffirmationPopUp.wrappedValue {
                popUpView(button: "Affirmations")
                  }
        }
            
            
    }
        
        
        
    private func popUpView(button: String) -> some View {
        VStack{
            Spacer()
            if (button == "Weather"){
                Text("Receive current weather conditions so you can be prepared for the day.").foregroundColor(.white).multilineTextAlignment(.center)
                Spacer()
                Button(action: {
                           withAnimation(.linear(duration: 0.5)) {
                               self.showWeatherPopUp = false
                            }
                        }, label: {
                                Text("Close")
                        })
                Spacer()
            }
            if (button == "Breathing"){
                Spacer()
                Text("Daily practice of deep breathing has been proven to stabilize blood pressure and reduce stress. It can also reduce anxiety. ").foregroundColor(.white).multilineTextAlignment(.center)
                Spacer()
                Button(action: {
                           withAnimation {
                               self.showBreathingPopUp = false
                            }
                        }, label: {
                                Text("Close")
                        })
                Spacer()
            }
            if (button == "Productivity"){
                Spacer()
                Text("Keep track of calendar events and tasks so you feel confident to conquer the day. ").foregroundColor(.white).multilineTextAlignment(.center)
                Spacer()
                Button(action: {
                           withAnimation {
                               self.showProductivityPopUp = false
                            }
                        }, label: {
                                Text("Close")
                        })
                Spacer()
            }
            if (button == "Activity"){
                Spacer()
                Text("Obtain inspiration for new activities and hobbies! ").foregroundColor(.white).multilineTextAlignment(.center)
                Spacer()
                Button(action: {
                           withAnimation {
                               self.showSuggestionPopUp = false
                            }
                        }, label: {
                                Text("Close")
                        })
            }
            if (button == "Quotes"){
                Spacer()
                Text("Start your day off with inspiration from one of our motivational quotes. ").foregroundColor(.white).multilineTextAlignment(.center)
                Spacer()
                Button(action: {
                           withAnimation {
                               self.showQuotePopUp = false
                            }
                        }, label: {
                                Text("Close")
                        })
                Spacer()
            }
            if (button == "Affirmations"){
                Spacer()
                Text("Affirmations give you the power to change your negative thinking patterns and replace them with positive thinking patterns. ").foregroundColor(.white).multilineTextAlignment(.center)
                Spacer()
                Button(action: {
                           withAnimation {
                               self.showAffirmationPopUp = false
                            }
                        }, label: {
                                Text("Close")
                        })
                Spacer()
            }
            
            
        }
            .padding()
            .frame(width: 240, height: 300)
            .background(colors[1])
            .cornerRadius(20)
            .shadow(radius: 20 )
        
    }
    
    
    
}






struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView(suggestionSelected: .constant(false), weatherSelected: .constant(false),quoteSelected: .constant(false), productivitySelected: .constant(false),breathingSelected: .constant(false), affirmationsSelected: .constant(false), editOrIntro: .constant("intro"))
    }
}
