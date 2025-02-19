//
//  EventDatabaseType.swift
//  SpeedDatingScheduler
//
//  Created by Harriet Symington on 2/19/25.
//

protocol EventDatabaseType {
    var events: [Event] { get }
    func deleteEvent(_: Event)
    func saveEvent(_: Event)
}
