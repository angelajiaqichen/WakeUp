import UIKit

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
