//
//  SuggestionView.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/10/22.
//

import SwiftUI

struct SuggestionView: View {
    @ObservedObject var viewModel = ViewModel()
    let colors = [
        Color(red: 0.69411, green: 0.70196, blue: 0.9333),
        Color(red: 0.9922, green: 0.9725, blue: 0.5333)]
    
    var body: some View {
        
            
              VStack{
                Spacer()
                Text("Today, We Suggest That You").padding()
                      .foregroundColor(.white)
                      .font(.custom(
                              "Avenir",
                              fixedSize: 40))
                      .multilineTextAlignment(.center)
                Spacer()
                Text("\(viewModel.suggestion.text)").padding()
                      .foregroundColor(.white)
                      .font(.custom(
                              "Avenir",
                              fixedSize: 30))
                      .multilineTextAlignment(.center)
                  Spacer()
                  Spacer()
                  
                  }
        
        
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(LinearGradient(colors: colors,
                                        startPoint: .center,
                                        endPoint: .bottom))
        
            
      
    }
  
}


struct SuggestionView_Previews: PreviewProvider {
    static var previews: some View {
      SuggestionView(viewModel: ViewModel())
    }
}

