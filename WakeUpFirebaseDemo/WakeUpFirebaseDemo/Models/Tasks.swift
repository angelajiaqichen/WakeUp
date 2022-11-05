//
//  Tasks.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/5/22.
//

import Foundation
import UIKit

struct TaskItem {
  let name: String?
}

//Each TaskItem will come from class EKReminder from apple calendar (https://developer.apple.com/documentation/eventkit)

struct Tasks {
  let items: [TaskItem]
}
