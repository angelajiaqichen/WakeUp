//
//  EKEventStore+AsyncFetch.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/28/22.
//
//  Modified from https://developer.apple.com/tutorials/app-dev-training/loading-reminders
//
//  An asynchronous wrapper function that can return Reminders inline.


import Foundation
import EventKit

extension EKEventStore {
    func fetchReminders(matching predicate: NSPredicate) async throws -> [EKReminder] {
        try await withCheckedThrowingContinuation { continuation in
            fetchReminders(matching: predicate) { reminders in
                if let reminders = reminders {
                    continuation.resume(returning: reminders)
                } else {
                    print("error")
                    //continuation.resume(throwing: TodayError.failedReadingReminders)
                }
            }
        }
    }
}

