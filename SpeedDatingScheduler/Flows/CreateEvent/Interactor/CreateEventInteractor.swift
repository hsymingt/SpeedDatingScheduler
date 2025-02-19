//
//  CreateEventInteractor.swift
//  SpeedDatingScheduler
//
//  Created by Harriet Symington on 2/19/25.
//

protocol CreateEventInteractorType {
    func saveEvent(_: Event)
}

class CreateEventInteractor: CreateEventInteractorType {
    private let eventDatabase: EventDatabaseType
    
    init(eventDatabase: EventDatabaseType) {
        self.eventDatabase = eventDatabase
    }
    
    func saveEvent(_ event: Event) {
        self.eventDatabase.saveEvent(event)
    }
}
