//
//  SummaryView.swift
//  WakeUpFirebaseDemo
//
//  Created by Rebecca Li on 12/4/22.
//
import SwiftUI

struct SummaryView: View {
    @ObservedObject private var userRepo = UserRepository()
    @ObservedObject var viewModel = ViewModel()
    let colors = [
        Color(red: 0.4902, green: 0.6039, blue: 1.0),
        Color(red: 0.3412, green: 1.0, blue: 0.7216)]
    
    let rectColors = [
        Color(red: 0.66274, green: 0.8741, blue: 0.6),
        Color(red: 0.64313, green: 0.65490, blue: 1.0)]
    
    var body: some View {
    
        VStack{
            Spacer()
            Text("Intention Summary").foregroundColor(.white)
                .font(.custom(
                        "Avenir",
                        fixedSize: 50))
                .multilineTextAlignment(.center)
          Spacer()
//            Text("\(String(userRepo.users.count))")
       
            ForEach(userRepo.users, id: \.id) { user in
                if user.deviceID == UIDevice.current.identifierForVendor?.uuidString{
                    if user.date == userRepo.date{
                        Spacer()
                        Text("\(user.intentions[0])")
                        Text("\(user.intentions[1])")
                        Text("\(user.intentions[2])")
                        Spacer()
                    }
//                    Text("This is the data from the firebase: \(String(userRepo.users.count))")
                    
                }
                
                //            List(userRepo.users){
                //                user in
                //                VStack(alignment: .leading){
                //                    Text("This is the data from the firebase")
                //                    Text("\(user.intentions[0])")
                //                    Text("\(user.intentions[1])")
                //                    Text("\(user.intentions[2])")
                //                }
                //            }.navigationBarTitle("Users")
                //                .onAppear(){
                //                    self.userRepo.get()
                //                    print("onapear is working")
                //                }
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(LinearGradient(colors: colors,
                                        startPoint: .top,
                                        endPoint: .bottom))
//      userRepository.get()
      
//      userRepository.reviewIntentions()
      

  }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
