//
//  AffirmationsView.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/6/22.
//

import SwiftUI

struct AffirmationsView: View {
    var body: some View {
      @ObservedObject var viewModel = ViewModel()
      var body: some View {
        VStack{
          Text("Quote of the Day:")
          Spacer()
          Text("\(viewModel.quote.text)")
          
        }

      }
    }
}

