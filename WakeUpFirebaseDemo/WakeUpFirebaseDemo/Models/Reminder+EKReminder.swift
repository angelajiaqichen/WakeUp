//
//  Reminder+EKReminder.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/28/22.
//
//  Modified from https://developer.apple.com/tutorials/app-dev-training/loading-reminders
//
//  Convert the EKReminder model type into Reminder model type

import Foundation
import EventKit

extension Reminder {
    init(with ekReminder: EKReminder) throws {
         // require all reminders to have an alarm, reminders with no due date will be automatically ignored
        guard let dueDate = ekReminder.alarms?.first?.absoluteDate else {
            //print(ekReminder.title!)
            //print("error - reminder has no due date")
            throw NSError(domain: "no due date", code: 42, userInfo: nil)
          
        }
        
        id = ekReminder.calendarItemIdentifier
        title = ekReminder.title
        //print(title)
        self.dueDate = dueDate
        //self.dueDate = ekReminder.dueDateComponents!
        notes = ekReminder.notes
        isComplete = ekReminder.isCompleted
    }
}

