//
//  TasksView.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 12/1/22.
//

import SwiftUI
import Foundation

struct CleanTasksView: View {
  @ObservedObject var viewModel = ViewModel()
  private var reminderStore: ReminderStore { ReminderStore.shared }

    let colors = [
        Color(red: 1.0, green: 0.8549, blue: 0.4784),
        Color(red: 1.0, green: 0.717647, blue: 0.7333)]
  let rectColors = [
      Color(red: 0.78431, green: 0.63529, blue: 0.78431),
      Color(red: 0.64313, green: 0.65490, blue: 1.0)]
  
  var body: some View {
      VStack{
          Spacer()
          Text("Your Day Ahead").font(.largeTitle)
              .foregroundColor(.white)
          Spacer()
          
          Text("You have\n\(String(viewModel.reminders.count)) tasks today").foregroundColor(.white).font(.largeTitle).multilineTextAlignment(.center)
          Spacer()
        
          // display each reminder's title
          ForEach(viewModel.reminders) {reminder in
            RoundedRectangle(cornerRadius: 25.0, style: .circular)
                .fill(rectColors[0])
                .overlay(
              Text("\(reminder.title)").multilineTextAlignment(.center)
                .foregroundColor(.white)
            ).frame(width: 350, height: 75)
          }
          
    
          Spacer()
          Spacer()
        
          Button(action: {}) {
            Text("Back")
          }
        
      }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
          .background(RadialGradient(colors: colors, center: .center, startRadius: 0, endRadius: 350)).onAppear(){
        Task {
          await prepareReminderStore()
        }
      }
      
  }
  
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
  
}
  


struct CleanTasksView_Previews: PreviewProvider {
    static var previews: some View {
        CleanTasksView(viewModel: ViewModel())
    }
}
