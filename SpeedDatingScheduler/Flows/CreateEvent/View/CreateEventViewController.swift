//
//  CreateEventViewController.swift
//  SpeedDatingScheduler
//
//  Created by Harriet Symington on 2/19/25.
//

import UIKit

class CreateEventViewController: UIViewController {
    // private state
    private var presenter: CreateEventPresenterType
    
    // subviews
    let titleLabel = UILabel()
    let eventNameLabel = UILabel()
    let eventNameTextField = UITextField()
    let dateLabel = UILabel()
    let calendarPicker = UIDatePicker()
    let createButton = UIButton()
    
    init(presenter: CreateEventPresenterType) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
      
        self.titleLabel.font = UIFont.systemFont(ofSize: 36.0, weight: .semibold)
        self.titleLabel.text = "Create New Event"
        
        self.eventNameLabel.text = "Event name:"
        self.eventNameLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .semibold)

        
        self.eventNameTextField.borderStyle = .roundedRect
        self.eventNameTextField.layer.borderColor = UIColor.black.cgColor
        self.eventNameTextField.delegate = self
        
        self.dateLabel.text = "Date:"
        self.dateLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .semibold)
        

        self.createButton.setTitleColor(.white, for: .normal)
        self.createButton.setTitle("Create", for: .normal)
        self.createButton.layer.cornerRadius = 10.0
        self.createButton.addTarget(self, action: #selector(self.createButtonTapped), for: .touchUpInside)
        self.createButton.backgroundColor = .lightGray
        self.createButton.isEnabled = false
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.eventNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.eventNameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.calendarPicker.translatesAutoresizingMaskIntoConstraints = false
        self.createButton.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.eventNameLabel)
        self.view.addSubview(self.eventNameTextField)
        self.view.addSubview(self.dateLabel)
        self.view.addSubview(self.calendarPicker)
        self.view.addSubview(self.createButton)

        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80.0),
            
            self.eventNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24.0),
            self.eventNameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.eventNameLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 64.0),
            
            self.eventNameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24.0),
            self.eventNameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24.0),
            self.eventNameTextField.topAnchor.constraint(equalTo: self.eventNameLabel.bottomAnchor, constant: 8.0),
            
            self.dateLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24.0),
            self.dateLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.dateLabel.topAnchor.constraint(equalTo: self.eventNameTextField.bottomAnchor, constant: 48.0),
            
            self.calendarPicker.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24.0),
            self.calendarPicker.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor, constant: 8.0),
            
            self.createButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.createButton.topAnchor.constraint(equalTo: self.calendarPicker.bottomAnchor, constant: 64.0),
            self.createButton.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor, constant: 0.0)
        ])
    }
    
    @objc func createButtonTapped() {
        self.presenter.handleCreateEventButtonTapped(name: self.eventNameTextField.text ?? "", date: self.calendarPicker.date)
    }
}

extension CreateEventViewController: UITextFieldDelegate {


    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text?.count ?? 0) > 1 {
            self.createButton.backgroundColor = .black
            self.createButton.isEnabled = true
        } else {
            self.createButton.backgroundColor = .lightGray
            self.createButton.isEnabled = false
        }
        return true
    }
}
