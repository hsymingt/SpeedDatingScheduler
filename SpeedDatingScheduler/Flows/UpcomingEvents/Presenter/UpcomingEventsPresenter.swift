//
//  UpcomingEventsPresenter.swift
//  SpeedDatingScheduler
//
//  Created by Harriet Symington on 2/19/25.
//

import Foundation

protocol UpcomingEventsPresenterType {
    var eventCount: Int { get }
    func handleEventDeleted(at index: Int)
    func getEventViewDataForIndex(index: Int) -> EventViewData
}

class UpcomingEventsPresenter: UpcomingEventsPresenterType {
    private let interactor: UpcomingEventsInteractorType
    var viewController: UpcomingEventsViewController?
    
    init(interactor: UpcomingEventsInteractorType) {
        self.interactor = interactor
    }
    
    var eventCount: Int { return self.interactor.events.count }
    
    func handleEventDeleted(at index: Int) {
        let event = self.interactor.events[index]
        self.interactor.deleteEvent(event)
        self.viewController?.refresh()
    }
    
    func getEventViewDataForIndex(index: Int) -> EventViewData {
        let event = self.interactor.events[index]
        let viewData = EventViewData(title: event.title, date: event.date.formatted())
        return viewData
    }

}
