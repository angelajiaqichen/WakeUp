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
                        RoundedRectangle(cornerRadius: 25.0, style: .circular)
                            .fill(rectColors[0])
                            .overlay(
                              Text("\(user.intentions[0])").multilineTextAlignment(.center)
                                  .foregroundColor(.white)
                            )
                            .frame(width: 350, height: 75)
                        RoundedRectangle(cornerRadius: 25.0, style: .circular)
                            .fill(rectColors[1])
                            .overlay(
                              Text("\(user.intentions[1])").multilineTextAlignment(.center)
                                  .foregroundColor(.white)
                            )
                            .frame(width: 350, height: 75)
                        RoundedRectangle(cornerRadius: 25.0, style: .circular)
                            .fill(rectColors[0])
                            .overlay(
                              Text("\(user.intentions[2])").multilineTextAlignment(.center)
                                  .foregroundColor(.white)
                            )
                            .frame(width: 350, height: 75)

                        Spacer()
                    }

               
                    
                }

                

            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(LinearGradient(colors: colors,
                                        startPoint: .top,
                                        endPoint: .bottom))

      

  }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
