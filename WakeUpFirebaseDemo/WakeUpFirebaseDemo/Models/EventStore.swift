//
//  EventStore.swift
//  WakeUpFirebaseDemo
//
//  Created by Angela Chen on 12/7/22.
//
//  Storage for Events data

import Foundation
import EventKit

class EventStore {
    static let shared = EventStore()
    
    private let ekStore = EKEventStore()
    
    var isAvailable: Bool {
        EKEventStore.authorizationStatus(for: .event) == .authorized
    }
    
    func requestAccess() async throws {
        let status = EKEventStore.authorizationStatus(for: .event)

        switch status {
        case .authorized:
            return
        case .restricted:
            print("error: access restricted")
            //throw Error.accessRestricted
        case .notDetermined:
            let accessGranted = try await ekStore.requestAccess(to: .event)
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
    
    func readAll() async throws -> [Event] {
        guard isAvailable else {
            //throw Error.accessDenied
            throw NSError(domain: "accessDenied", code: 500, userInfo: nil)
        }
        //let dayFromNow = Date().advanced(by: TimeInterval.day)
        let predicate = ekStore.predicateForEvents(withStart: Date(), end: Date(), calendars: nil)
        //let predicate = ekStore.predicateForEvents(withStart: self.initialDates.first!, end: self.initialDates.last!, calendars: nil)
        // QUESTION ASK HOW TO GET EVENTS THAT DONT LAST ALL DAY
        let ekEvents = ekStore.events(matching: predicate)
        /*
        let ekEvents = try await ekStore.fetchEvents(matching: predicate)*/
        let events: [Event] = try ekEvents.compactMap { ekEvent in
            do {
                return try Event(with: ekEvent)
            //} catch Error.eventHasNEndDate {
            } catch {
                return nil
            }
        }
        return events
    }
}

