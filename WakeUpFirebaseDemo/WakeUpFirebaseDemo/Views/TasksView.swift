//
//  TasksView.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 12/1/22.
//

import SwiftUI
import Foundation

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
          Text("\(String(viewModel.reminders.count))")
            
          
    
          Spacer()
          Spacer()
        
          Button(action: {}) {
            Text("Back")
          }
        
      //}.onAppear(perform: loadTasks)
      }.onAppear(){
        Task {
          await prepareReminderStore()
        }
      }
    
    
      
  }
  
  /*func loadTasks() { //viewDidLoad dupe/simulation
      //ReminderStore...
      //private var reminderStore: ReminderStore { ReminderStore.shared }
      print("preparing reminder store")
      //var reminders: [Reminder] = []
      let reminders = prepareReminderStore()
      print("in load tasks")
      print(reminders!.count) //should be 5 but now 0
      for reminder in reminders!{
        print(reminder.title)
      }
      print("prepared reminder store")
    
      //reminderStore.fetchWeather { (task) in
          
          //print(task)

          //self.viewModel.weatherType = weather.weatherType
          //self.viewModel.weatherTemp = weather.weatherDetails.imperial.value
          
      }*/
  
  
  func prepareReminderStore() async {

      var reminders: [Reminder] = [] // all reminders
      var remindersToday: [Reminder] = []
      let doTask = Task { () -> [Reminder] in
        //must call functions marked as async from within a Task or another asynchronous function
          do {
              try await reminderStore.requestAccess()
              print("preparing reminderstore - requested access")
              reminders = try await reminderStore.readAll()
              print(reminders.count)
              /*for reminder in reminders{
                print(reminder.dueDate)
              }*/
              print("preparing reminderstore - done read all")
              
          } catch {
              print("error - unknown, failed to prepare reminder store")
          }
          return reminders
      }
    
    let result = await doTask.result
    do {
      let reminders = try result.get() // this gets all reminders that have a dueDate, those without a due date are automatically filtered out
      for reminder in reminders{
        //print(reminder.dueDate)
        if Calendar.current.isDateInToday(reminder.dueDate){ // this gets today's reminders
          remindersToday.append(reminder)
          //print(reminder.dueDate)
        }
      }
      viewModel.reminders = remindersToday // save the retrieved reminders to the viewmodel
      //print(reminders.count)
      //print(remindersToday.count)
    } catch {
      print("error - cannot get() the result of the Task")
    }

  }
  
  
  /*
  func prepareReminderStore() -> [Reminder]? {
      var reminders: [Reminder] = []
      Task {
        //must call functions marked as async from within a Task or another asynchronous function
          do {
              try await reminderStore.requestAccess()
              print("preparing reminderstore - requested access")
              reminders = try await reminderStore.readAll()
              print(reminders.count) //5 //?how do i fetch these reminders outside of the task
              /*for reminder in reminders{
                print(reminder.title)
              }*/
              print("preparing reminderstore - done read all")
              
          } catch {
              print("There is an error!")
          }
          print("no error")
          return reminders
      }
      print(reminders.count) // 0
      return reminders // this is causing the issue -- it's returning (an empty list) as soon as prepareReminderStore() is called
  }
  */
  
}
  


struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
