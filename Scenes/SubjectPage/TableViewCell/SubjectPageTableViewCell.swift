//
//  SubjectPageTableViewCell.swift
//  QuizApp
//
//  Created by tornike ivanashvili on 26.06.23.
//

import UIKit

class SubjectPageTableViewCell: UITableViewCell {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.ContainerView.backgroundColor
        view.layer.cornerRadius = Constants.ContainerView.cornerRadius
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        return iconImageView
    }()
    
    private let subjectNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = Constants.SubjectNameLabel.font
        nameLabel.backgroundColor = Constants.SubjectNameLabel.backgroundColor
        nameLabel.textColor = Constants.SubjectNameLabel.textColor
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = Constants.DescriptionLabel.font
        descriptionLabel.backgroundColor = Constants.DescriptionLabel.backgroundColor
        descriptionLabel.textColor = Constants.DescriptionLabel.textColor
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupContainerViewConstraints()
        setupIconImageViewConstrains()
        setupNameLabelConstraints()
        setupDescriptionLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Constraints Setup
    private func setupContainerViewConstraints() {
        contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: Constants.ContainerView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: Constants.ContainerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: Constants.ContainerView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.ContainerView.bottomAnchor)
        ])
    }
    
    private func setupIconImageViewConstrains() {
        containerView.addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.IconImageView.topAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.IconImageView.bottomAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.IconImageView.leadingAnchor)
        ])
    }
    
    private func setupNameLabelConstraints() {
        containerView.addSubview(subjectNameLabel)
        NSLayoutConstraint.activate([
            subjectNameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: Constants.SubjectNameLabel.leadingAnchor),
            subjectNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.SubjectNameLabel.topAnchor),
        ])
    }
    
    private func setupDescriptionLabelConstraints() {
        containerView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: subjectNameLabel.bottomAnchor, constant: Constants.DescriptionLabel.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: Constants.DescriptionLabel.leadingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.DescriptionLabel.bottomAnchor)
        ])
    }
    
    func configure(with subject: Subject) {
        iconImageView.image = UIImage(named: subject.icon)
        subjectNameLabel.text = subject.name
        descriptionLabel.text = subject.description
    }
}

// MARK: - Constants
private extension SubjectPageTableViewCell {
    enum Constants {
        enum ContainerView {
            static let backgroundColor = UIColor(hex: "F6F6F6")
            static let cornerRadius: CGFloat = 26
            static let topAnchor: CGFloat = 9
            static let leadingAnchor: CGFloat = 20
            static let trailingAnchor: CGFloat = -20
            static let widthAnchor: CGFloat = 344
            static let heightAnchor: CGFloat = 106
            static let bottomAnchor: CGFloat = -9
        }
        
        enum IconImageView {
            static let topAnchor: CGFloat = 22
            static let bottomAnchor: CGFloat = -22
            static let leadingAnchor: CGFloat = 29.5
        }
        
        enum SubjectNameLabel {
            static let font: UIFont = .systemFont(ofSize: 16)
            static let backgroundColor: UIColor = .clear
            static let textColor: UIColor = .black
            static let leadingAnchor: CGFloat = 18
            static let topAnchor: CGFloat = 33
        }
        
        enum DescriptionLabel {
            static let backgroundColor: UIColor = .clear
            static let font: UIFont = .systemFont(ofSize: 10)
            static let textColor = UIColor(hex: "B3B3B3")
            static let topAnchor: CGFloat = 2
            static let leadingAnchor: CGFloat = 18
            static let bottomAnchor: CGFloat = -34
        }
    }
}

