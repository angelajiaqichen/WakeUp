//
//  Events.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/5/22.
//

import Foundation

struct Event: Equatable, Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var endDate: Date

}

extension Array where Element == Event {
    func indexOfCalendar(with id: Event.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        return index
    }
}

