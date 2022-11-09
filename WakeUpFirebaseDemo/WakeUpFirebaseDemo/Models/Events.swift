//
//  Events.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/5/22.
//

import UIKit
import Foundation

struct EventItem {
  let name: String?
  let location: String?
  let startTime: String?
  let endTime: String?
}

//Each event will come from class EKEvent from apple calendar (https://developer.apple.com/documentation/eventkit)

struct Events {
  let items: [EventItem]
}

