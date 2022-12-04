//
//  SummaryView.swift
//  WakeUpFirebaseDemo
//
//  Created by Rebecca Li on 12/4/22.
//

import SwiftUI

struct SummaryView: View {
    @ObservedObject private var viewModel = IntentionViewModel()
   
    var body: some View {
        NavigationView {
            List(viewModel.users){
                user in
                VStack(alignment: .leading){
                    Text(user.UUID)
                    Text(user.streak)
                    Text(user.UUID)
                    Text(user.UUID)
                   
                }
            }.navigationBarTitle("Users")
                .onAppear(){
                    self.viewModel.fetchData()
                }
        }
//      userRepository.get()
      
//      userRepository.reviewIntentions()
      

  }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
