//
//  ReminderStore.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 11/28/22.
//
//  Modified from https://developer.apple.com/tutorials/app-dev-training/loading-reminders
//
//  Storage for Reminders data

import Foundation
import EventKit

class ReminderStore {
    static let shared = ReminderStore()
    
    private let ekStore = EKEventStore()
    
    var isAvailable: Bool {
        EKEventStore.authorizationStatus(for: .reminder) == .authorized
    }
    
    func requestAccess() async throws {
        let status = EKEventStore.authorizationStatus(for: .reminder)

        switch status {
        case .authorized:
            return
        case .restricted:
            print("error: access restricted")
            //throw Error.accessRestricted
        case .notDetermined:
            let accessGranted = try await ekStore.requestAccess(to: .reminder)
            guard accessGranted else {
                print("error: access not determined and denied")
                return
                //throw Error.accessDenied
            }
        case .denied:
            print("error: access denied")
            //throw Error.accessDenied
        @unknown default:
            print("error: unknown error")
            //throw Error.unknown
        }
    }
    
    func readAll() async throws -> [Reminder] {
        guard isAvailable else {
            //throw Error.accessDenied
            throw NSError(domain: "accessDenied", code: 500, userInfo: nil)
        }
        
        let predicate = ekStore.predicateForReminders(in: nil)
        let ekReminders = try await ekStore.fetchReminders(matching: predicate)
        let reminders: [Reminder] = try ekReminders.compactMap { ekReminder in
            do {
                return try Reminder(with: ekReminder)
            //} catch Error.reminderHasNoDueDate {
            } catch {
                return nil
            }
        }
        return reminders
    }
}

