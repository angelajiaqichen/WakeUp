//
//  Calendar.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/18/22.
//

import Foundation

struct Calendar: Equatable, Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var dueDate: Date
    var notes: String? = nil
    var isComplete: Bool = false
}

extension Array where Element == Calendar {
    func indexOfCalendar(with id: Calendar.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        return index
    }
}
