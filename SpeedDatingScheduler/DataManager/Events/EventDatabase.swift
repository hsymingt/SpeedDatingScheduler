//
//  EventManager.swift
//  SpeedDatingScheduler
//
//  Created by Harriet Symington on 2/19/25.
//

import CoreData
import UIKit

class EventDatabase: EventDatabaseType {
    private var _events: [Event]
    
    init() {
        if let data = UserDefaults.standard.object(forKey: "events") as? Data,
           let events = try? JSONDecoder().decode([Event].self, from: data) {
            self._events = events
        } else {
            self._events = []
        }
    }
    
    var events: [Event] {
        return self._events.sorted(by: { $0.date.compare($1.date) == .orderedAscending })
    }
    
    func deleteEvent(_ event: Event) {
        self._events = self._events.filter { $0 != event }
        
        do {
            let encodedData = try JSONEncoder().encode(self._events)
            UserDefaults.standard.set(encodedData, forKey: "events")

        } catch {}
    }
    
    func saveEvent(_ event: Event) {
        self._events.append(event)
        
        do {
            let encodedData = try JSONEncoder().encode(self._events)
            UserDefaults.standard.set(encodedData, forKey: "events")

        } catch {}
    }
}
