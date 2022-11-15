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
    var body: some View {
        VStack{

            Text("**WakeUp**").font(.system(size: 36))
                .foregroundColor(.white)
            Text("Welcome!").font(.system(size: 20))
                .foregroundColor(.white)
            Text("Select the features you would like in your routine")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
            
            Spacer()
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
                            Text("Weather").foregroundColor(.purple)
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
                            Text("Breathing").foregroundColor(.purple)
                        }
                    }
                }
                Spacer()
            }
              
              
        
            Spacer()
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
                            Text("Productivity").foregroundColor(.purple)
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
                            Text("Suggested Activity").foregroundColor(.purple)
                        }
                    }
                }
                Spacer()
                
            }

    
          
            Spacer()
            HStack(alignment: .center) {
                Spacer()
                
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
                            Text("Daily Quotes").foregroundColor(.purple)
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
                            Text("Affirmations").foregroundColor(.purple)
                            }
                        }
                    }
                
                Spacer()
                }
            
            Spacer()
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(RadialGradient(colors: colors, center: .center, startRadius: 0, endRadius: 350))
            
    
        }
      
    
    }


struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView(suggestionSelected: .constant(false), weatherSelected: .constant(false),quoteSelected: .constant(false), productivitySelected: .constant(false),breathingSelected: .constant(false), affirmationsSelected: .constant(false))
    }
}
