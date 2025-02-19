//
//  ScheduleViewController.swift
//  SpeedDatingScheduler
//
//  Created by Harriet Symington on 2/19/25.
//

import UIKit

class UpcomingEventsViewController: UIViewController {
    // private state
    private let presenter: UpcomingEventsPresenterType
    
    // subviews
    let titleLabel = UILabel()
    let tableView = UITableView()
    let createButton = UIButton()
    
    init(presenter: UpcomingEventsPresenterType) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    
        // configure title label
        self.titleLabel.font = .systemFont(ofSize: 32.0, weight: .semibold)
        self.titleLabel.textColor = .black
        self.titleLabel.text = "Upcoming Events"
        self.titleLabel.numberOfLines = 0
        self.titleLabel.textAlignment = .center
        
        // configure table view
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(EventCell.self, forCellReuseIdentifier: EventCell.reuseIdentifier)
        
        // configure create button
        self.createButton.layer.cornerRadius = 10.0
        self.createButton.setTitle("New Event +", for: .normal)
        self.createButton.setTitleColor(.blue, for: .normal)
        self.createButton.titleLabel?.font = .boldSystemFont(ofSize: 16.0)
        self.createButton.addTarget(self, action: #selector(self.createEventButtonTapped), for: .touchUpInside)
        
        // add subviews
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.createButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.createButton)
        
        NSLayoutConstraint.activate([
            // title constraints
            self.titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64.0),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            // table constraints
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 32.0),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            // button constraints
            self.createButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.createButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -48.0)
        ])
    }
    
    @objc func createEventButtonTapped() {
        let onDismiss: (() -> Void) = {
            self.refresh()
        }
        let createEventViewController = FlowFactory.shared.createCreateEventViewController(onDismiss: onDismiss)
        self.present(createEventViewController, animated: true)
    }
    
    func refresh() {
        self.tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension UpcomingEventsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.eventCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EventCell.reuseIdentifier) as? EventCell else { return UITableViewCell() }
        let viewData = self.presenter.getEventViewDataForIndex(index: indexPath.row)
        cell.configure(viewData: viewData)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension UpcomingEventsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { [unowned self] action, view, completionHandler in
            self.presenter.handleEventDeleted(at: indexPath.row)
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
}
    

struct EventViewData {
    let title: String
    let date: String
}
