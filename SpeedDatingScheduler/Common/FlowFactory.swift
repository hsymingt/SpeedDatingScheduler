//
//  Wireframe.swift
//  SpeedDatingScheduler
//
//  Created by Harriet Symington on 2/19/25.
//

import UIKit

class FlowFactory {
    static let shared: FlowFactory = {
        let instance = FlowFactory()
        return instance
    }()
    
    private let eventDatabase = EventDatabase()
    private let userProfileManager = UserProfileManager()
    
    func createUpcomingEventsViewController() -> UIViewController {        
        let interactor = UpcomingEventsInteractor(eventDatabase: self.eventDatabase)
        let presenter = UpcomingEventsPresenter(interactor: interactor)
        let vc = UpcomingEventsViewController(presenter: presenter)
        
        presenter.viewController = vc
        return vc
    }
    
    func createCreateEventViewController(onDismiss: (() -> Void)?) -> UIViewController {
        let interactor = CreateEventInteractor(eventDatabase: self.eventDatabase)
        let presenter = CreateEventPresenter(interactor: interactor, onDismiss: onDismiss)
        let vc = CreateEventViewController(presenter: presenter)
        
        presenter.viewController = vc
        return vc
    }
}
