//
//  EventCell.swift
//  SpeedDatingScheduler
//
//  Created by Harriet Symington on 2/19/25.
//

import UIKit

class EventCell: UITableViewCell {
    static var reuseIdentifier = "EventCell"

    
    // subviews
    var labelStack = UIStackView()
    var titleLabel = UILabel()
    var dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension EventCell {
    func commonInit() {
        self.backgroundColor = .white
        
        // configure label stack
        self.labelStack.axis = .vertical
        
        // configure title label
        self.titleLabel.font = UIFont.systemFont(ofSize: 20.0)
        self.titleLabel.textColor = .black
        
        // configure date label
        self.dateLabel.font = UIFont.systemFont(ofSize: 16.0)
        self.dateLabel.textColor = .lightGray

        
        // add subviews
        self.labelStack.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.labelStack)
        self.labelStack.addArrangedSubview(self.titleLabel)
        self.labelStack.addArrangedSubview(self.dateLabel)

        // add constraints
        NSLayoutConstraint.activate([
            // label stack constraints
            self.labelStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24.0),
            self.labelStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24.0),
            self.labelStack.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 24.0),
            self.labelStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -24.0)
        ])
    }
}

extension EventCell {
    func configure(viewData: EventViewData) {
        self.titleLabel.text = viewData.title
        self.dateLabel.text = viewData.date
    }
}
