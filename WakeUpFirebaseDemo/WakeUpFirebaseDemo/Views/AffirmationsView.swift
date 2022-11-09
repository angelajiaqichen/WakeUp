//
//  AffirmationsView.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/6/22.
//

import SwiftUI

struct AffirmationsView: View {


    @ObservedObject var viewModel = ViewModel()
    var body: some View {
      VStack{
        Text("Affirmations").font(.largeTitle)
        Text("Repeat the following sentences:")
        Spacer()
        Text("\(viewModel.affirmations[0].text)")
        Text("\(viewModel.affirmations[1].text)")
        Text("\(viewModel.affirmations[2].text)")
        Text("\(viewModel.affirmations[3].text)")
        Text("\(viewModel.affirmations[4].text)")
        
        Spacer()
        Spacer()
      }

    }
    

}

