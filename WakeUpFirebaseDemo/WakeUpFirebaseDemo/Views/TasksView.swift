//
//  TasksView.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 12/1/22.
//

import SwiftUI

struct TasksView: View {
  @ObservedObject var viewModel = ViewModel()
  private var reminderStore: ReminderStore { ReminderStore.shared }
  //var reminders: [Reminder] = []
  
  let colors = [
      Color(red: 0.69411, green: 0.70196, blue: 0.9333),
      Color(red: 0.99216, green: 0.9725, blue: 0.5333),
      Color(red: 0.9333, green: 0.9333, blue: 0.6980)]
  var body: some View {
      VStack{
          Spacer()
          Text("Your Day Ahead").font(.largeTitle)
              .foregroundColor(.white)
          Spacer()
          Text("You have X tasks today") // CHANGE "X" INTO NUM OF TASKS
          //Text("\(String(format: "%.0f",self.viewModel.weatherTemp))ºF\n \(self.viewModel.weatherType)")
        
                  
  
          Spacer()
          Spacer()
        
          Button(action: {}) {
            Text("Back")
          }
          
      }.onAppear(perform: loadTasks)
    
    /*
          .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
          .background(LinearGradient(colors: colors,
                                      startPoint: .top,
                                      endPoint: .bottom))
     */
      
  }
  
  func loadTasks() { //viewDidLoad dupe/simulation
      //ReminderStore...
      //private var reminderStore: ReminderStore { ReminderStore.shared }
      prepareReminderStore()
      //reminderStore.fetchWeather { (task) in
          
          //print(task)

          //self.viewModel.weatherType = weather.weatherType
          //self.viewModel.weatherTemp = weather.weatherDetails.imperial.value
          
      }
  
  func prepareReminderStore() {
      var reminders: [Reminder] = []
      Task { //must call functions marked as async from within a Task or another asynchronous function
          do {
              try await reminderStore.requestAccess()
              reminders = try await reminderStore.readAll()
          /*
          } catch TodayError.accessDenied, TodayError.accessRestricted {
              #if DEBUG
              reminders = Reminder.sampleData
              #endif
           */
          } catch {
              //showError(error)
              //print(error)
              print("There is an error!")
          }
          //updateSnapshot()
      }
  }
  
  
  
  
}
  


struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
