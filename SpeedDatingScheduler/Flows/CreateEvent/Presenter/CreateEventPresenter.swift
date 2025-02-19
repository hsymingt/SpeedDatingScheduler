//
//  CreateEventPresenter.swift
//  SpeedDatingScheduler
//
//  Created by Harriet Symington on 2/19/25.
//

import Foundation

protocol CreateEventPresenterType {
    func handleCreateEventButtonTapped(name: String, date: Date)
}

class CreateEventPresenter: CreateEventPresenterType {
    // private state
    private let interactor: CreateEventInteractorType
    private let onDismiss: (() -> Void)?
    
    // public state
    var viewController: CreateEventViewController?
    
    init(interactor: CreateEventInteractorType, onDismiss: (() -> Void)?) {
        self.interactor = interactor
        self.onDismiss = onDismiss
    }
    
    func handleCreateEventButtonTapped(name: String, date: Date) {
        let event = Event(title: name, date: date)
        self.interactor.saveEvent(event)
        self.viewController?.dismiss(animated: true) { [weak self] in
            guard let self else { return }
            self.onDismiss?()
        }
    }
}
