//
//  WeatherView.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/6/22.
//

import SwiftUI

struct WeatherView: View {
    //var weather: Weather
    @ObservedObject var viewModel = ViewModel()
    let colors = [
        Color(red: 0.69411, green: 0.70196, blue: 0.9333),
        Color(red: 0.99216, green: 0.9725, blue: 0.5333),
        Color(red: 0.9333, green: 0.9333, blue: 0.6980)]
    var body: some View {
        VStack{
            Spacer()
            Text("Today's Forecast").font(.largeTitle)
                .foregroundColor(.white)
            Spacer()
            Circle()
                .fill(colors[2])
                .padding(3)
                .frame(width:250, height:250)
                .overlay(
                    Text("\(String(format: "%.0f",self.viewModel.weatherTemp))ºF\n \(self.viewModel.weatherType)").font(.custom(
                        "Avenir",
                        fixedSize: 40))
                    .multilineTextAlignment(.center)
                        .foregroundColor(.blue)
                        .padding()
                )
            
            

                    
    
            Spacer()
            Spacer()
            
        }.onAppear(perform: loadData)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(LinearGradient(colors: colors,
                                        startPoint: .top,
                                        endPoint: .bottom))
        
    }
    
    func loadData() {
        WeatherParser().fetchWeather { (weather) in
            
            print(weather)
            print(weather.weatherDetails.imperial.value)
            self.viewModel.weatherType = weather.weatherType
            self.viewModel.weatherTemp = weather.weatherDetails.imperial.value
            
        }
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: ViewModel())
    }
}

