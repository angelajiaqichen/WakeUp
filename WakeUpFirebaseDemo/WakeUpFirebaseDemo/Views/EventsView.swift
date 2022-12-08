//
//  EventsView.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 12/7/22.
//

import SwiftUI
import Foundation

struct EventsView: View {
  @ObservedObject var viewModel = ViewModel()
  private var eventStore: EventStore { EventStore.shared }

  let colors = [
      Color(red: 0.69411, green: 0.70196, blue: 0.9333),
      Color(red: 0.99216, green: 0.9725, blue: 0.5333),
      Color(red: 0.9333, green: 0.9333, blue: 0.6980)]
  let rectColors = [
      Color(red: 0.78431, green: 0.63529, blue: 0.78431),
      Color(red: 0.64313, green: 0.65490, blue: 1.0)]
  
  var body: some View {
      VStack{
          Spacer()
          Text("Your Day Ahead").font(.largeTitle)
              //.foregroundColor(.white)
          Spacer()
          
          Text("You have\n\(String(viewModel.events.count)) tasks today").font(.largeTitle).multilineTextAlignment(.center)
          Spacer()
        
          // display each event's title
          ForEach(viewModel.events) {event in
            RoundedRectangle(cornerRadius: 25.0, style: .circular)
                .fill(rectColors[0])
                .overlay(
              Text("\(event.title)").multilineTextAlignment(.center)
                .foregroundColor(.white)
            ).frame(width: 350, height: 75)
          }
          
    
          Spacer()
          Spacer()
        
          Button(action: {}) {
            Text("Back")
          }
        
      }.onAppear(){
        Task {
          await prepareEventStore()
        }
      }
      
  }
  
  func prepareEventStore() async {

      var events: [Event] = [] // all events
      var eventsToday: [Event] = []
      let doTask = Task { () -> [Event] in
        //must call functions marked as async from within a Task or another asynchronous function
          do {
              try await eventStore.requestAccess()
              print("preparing eventstore - requested access")
              events = try await eventStore.readAll()
              print(events.count)
              /*for event in events{
                print(event.dueDate)
              }*/
              print("preparing eventstore - done read all")
              
          } catch {
              print("error - unknown, failed to prepare event store")
          }
          return events
      }
    
    let result = await doTask.result
    do {
      let events = try result.get() // this gets all events that have a dueDate, those without a due date are automatically filtered out
      for event in events{
        //print(event.dueDate)
        if Calendar.current.isDateInToday(event.dueDate){ // this gets today's events
          eventsToday.append(event)
          //print(event.dueDate)
        }
      }
      viewModel.events = eventsToday // save the retrieved events to the viewmodel
      //print(events.count)
      //print(eventsToday.count)
    } catch {
      print("error - cannot get() the result of the Task")
    }

  }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
