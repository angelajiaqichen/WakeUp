//
//  Event+EKEvent.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 12/7/22.
//

import Foundation
import EventKit

extension Event {
    init(with ekEvent: EKEvent) throws {
         // require all Events to have an alarm, Events with no due date will be automatically ignored
        guard let endDate = ekEvent.endDate else {
            //print(ekEvent.title!)
            //print("error - Event has no due date")
            throw NSError(domain: "no end date", code: 42, userInfo: nil)
          
        }
        
        id = ekEvent.calendarItemIdentifier
        title = ekEvent.title

        self.endDate = endDate

    }
}

