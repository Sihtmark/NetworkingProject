//
//  ProfileCell.swift
//  NetworkingProject
//
//  Created by Sergei Poluboiarinov on 2022-11-16.
//

import Foundation
import UIKit

class ProfileCell: UITableViewCell {
    let userIdLabel = UILabel()
    let idLabel = UILabel()
    let titleLabel = UILabel()
    static let reuseID = "ProfileCell"
    static let rowHeight: CGFloat = 110
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileCell {
    func setup() {
        userIdLabel.translatesAutoresizingMaskIntoConstraints = false
        
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(userIdLabel)
        contentView.addSubview(idLabel)
        contentView.addSubview(titleLabel)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            userIdLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            userIdLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            idLabel.topAnchor.constraint(equalToSystemSpacingBelow: userIdLabel.bottomAnchor, multiplier: 1),
            idLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: idLabel.bottomAnchor, multiplier: 1),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
        ])
    }
}

