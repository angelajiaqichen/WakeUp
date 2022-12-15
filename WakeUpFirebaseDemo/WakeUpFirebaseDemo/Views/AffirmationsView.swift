//
//  AffirmationsView.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/6/22.
//

import SwiftUI

struct AffirmationsView: View {
    @ObservedObject var viewModel = ViewModel()
    @ObservedObject private var userRepo = UserRepository()
    
    let colors = [
        Color(red: 0.4902, green: 0.6039, blue: 1.0),
        Color(red: 0.3412, green: 1.0, blue: 0.7216)]
    
    let rectColors = [
        Color(red: 0.66274, green: 0.8741, blue: 0.6),
        Color(red: 0.64313, green: 0.65490, blue: 1.0)]
    var body: some View {
        VStack{
            Spacer()
            Text("Affirmations")
                .foregroundColor(.white)
                .font(.custom(
                    "Avenir",
                    fixedSize: 50))
                .multilineTextAlignment(.center)
            Spacer()
            Text("Repeat the following sentences:")
                .foregroundColor(.white)
                .font(.custom(
                    "Avenir",
                    fixedSize: 20))
                .multilineTextAlignment(.center)
            /*
            ForEach(userRepo.users, id: \.id) { user in
                if user.deviceID == UIDevice.current.identifierForVendor?.uuidString{
                    if user.date == userRepo.date{
                        */
                        RoundedRectangle(cornerRadius: 25.0, style: .circular)
                            .fill(rectColors[0])
                            .overlay(
                                Text("\(viewModel.affirmations[0].text)\n").bold().multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            ).frame(width: 350, height: 75)
                        RoundedRectangle(cornerRadius: 25.0, style: .circular)
                            .fill(rectColors[1])
                            .overlay(
                                Text("\(viewModel.affirmations[1].text)").bold().multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            ).frame(width: 350, height: 75)
                        RoundedRectangle(cornerRadius: 25.0, style: .circular)
                            .fill(rectColors[0])
                            .overlay(
                                Text("\(viewModel.affirmations[2].text)").bold().multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            ).frame(width: 350, height: 75)
                        RoundedRectangle(cornerRadius: 25.0, style: .circular)
                            .fill(rectColors[1])
                            .overlay(
                                Text("\(viewModel.affirmations[3].text)").bold().multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            ).frame(width: 350, height: 75)
                        RoundedRectangle(cornerRadius: 25.0, style: .circular)
                            .fill(rectColors[0])
                            .overlay(
                                Text("\(viewModel.affirmations[4].text)").bold().multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            )
                        
                            .frame(width: 350, height: 75)
            Spacer()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(LinearGradient(colors: colors,
                                        startPoint: .top,
                                        endPoint: .bottom))
        
    }
}

struct AffirmationsView_Previews: PreviewProvider {
    static var previews: some View {
        AffirmationsView(viewModel: ViewModel())
    }
}

