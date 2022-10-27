import UIKit

struct TaskItem {
  let name: String?
}

//Each TaskItem will come from class EKReminder from apple calendar (https://developer.apple.com/documentation/eventkit)

struct Tasks {
  let items: [TaskItem]
}
