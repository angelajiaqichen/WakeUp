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
        Color(red: 1.0, green: 0.8549, blue: 0.4784),
        Color(red: 1.0, green: 0.717647, blue: 0.7333)]
    
    var body: some View {
        
            
              VStack{
                Text("Today, We Suggest That You").padding()
                      .foregroundColor(.white)
                      .font(.custom(
                              "Avenir",
                              fixedSize: 40))
                Spacer()
                Text("\(viewModel.quote.text)").padding()
                      .foregroundColor(.white)
                      .font(.custom(
                              "Avenir",
                              fixedSize: 50))
                      .multilineTextAlignment(.center)
                Spacer()
                Spacer()
              }
        
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(LinearGradient(colors: colors,
                                    startPoint: .top,
                                    endPoint: .center))
    
      
      
      
      
    }
  
}


struct SuggestionView_Previews: PreviewProvider {
    static var previews: some View {
      SuggestionView(viewModel: ViewModel())
    }
}

