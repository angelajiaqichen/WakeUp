//
//  QuoteView.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/6/22.
//

import SwiftUI

struct QuoteView: View {
  @ObservedObject var viewModel = ViewModel()
    var body: some View {
      Text("Hello, World! This is the QuoteView")
      
      Text("Quote: \(viewModel.quote.text)")
      
      ZStack{ // ? this zstack doesn't show up
          Text("Hi, this is a zstack")
          Text("\(viewModel.quote.text)").frame(width: 350, height:200).padding()
        }
      /*
      .overlay(
        RoundedRectangle(cornerRadius: 10.0)
          .stroke(Color.gray)
      )
       */
      
    }
  
}

