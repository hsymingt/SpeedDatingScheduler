//
//  UpcomingEventsInteractor.swift
//  SpeedDatingScheduler
//
//  Created by Harriet Symington on 2/19/25.
//

protocol UpcomingEventsInteractorType {
    var events: [Event] { get }
    func deleteEvent(_: Event)
}

class UpcomingEventsInteractor: UpcomingEventsInteractorType {
    private let eventDatabase: EventDatabaseType
    
    init(eventDatabase: EventDatabaseType) {
        self.eventDatabase = eventDatabase
    }
    
    var events: [Event] {
        return self.eventDatabase.events
    }
    
    func deleteEvent(_ event: Event) {
        self.eventDatabase.deleteEvent(event)
    }
}
