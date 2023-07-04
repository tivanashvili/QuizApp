//
//  ScoreView.swift
//  QuizApp
//
//  Created by tornike ivanashvili on 04.07.23.
//

import UIKit

class ScoreView: UIView {
    
    // MARK: Components
    private let gpaLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: Constants.GpaLabel.text)
        
        let gpaTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: Constants.GpaLabel.gpaTextColour
        ]
        attributedString.addAttributes(gpaTextAttributes, range: NSRange(location: 0, length: 5))
        
        let gpaValueAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: Constants.GpaLabel.gpaValueColor
        ]
        attributedString.addAttributes(gpaValueAttributes, range: NSRange(location: 5, length: attributedString.length - 5))
        
        label.backgroundColor = .clear
        label.font = .boldSystemFont(ofSize: Constants.GpaLabel.textFontSize)
        label.textAlignment = .center
        label.layer.cornerRadius = Constants.GpaLabel.gpaLabelCornerRadius
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = attributedString
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.DetailLabel.text
        label.textColor = Constants.DetailLabel.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let gpaVectorImage: UIImageView = {
        let image = UIImageView()
        image.image = Constants.GpaVectorImage.image
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupGpaLabelConstraints()
        setupDetailLabelConstraints()
        setupGpaVectorImageConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupGpaLabelConstraints() {
        addSubview(gpaLabel)
        NSLayoutConstraint.activate([
            gpaLabel.topAnchor.constraint(equalTo: topAnchor,
                                          constant: Constants.GpaLabel.gpaLabelTop),
            gpaLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                              constant: Constants.GpaLabel.gpaLabelLeading),
            gpaLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            gpaLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.GpaLabel.gpaLabelWidth)
        ])
    }
    
    private func setupDetailLabelConstraints() {
        addSubview(detailLabel)
        NSLayoutConstraint.activate([
            detailLabel.topAnchor.constraint(equalTo: topAnchor,
                                             constant: Constants.DetailLabel.topAnchor),
            detailLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupGpaVectorImageConstraints() {
        addSubview(gpaVectorImage)
        NSLayoutConstraint.activate([
            gpaVectorImage.topAnchor.constraint(equalTo: topAnchor,
                                                constant: Constants.GpaVectorImage.top),
            gpaVectorImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            gpaVectorImage.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                     constant: Constants.GpaVectorImage.trailing),
            gpaVectorImage.leadingAnchor.constraint(equalTo: detailLabel.trailingAnchor,
                                                    constant: Constants.GpaVectorImage.leading)
        ])
    }
    
}

private extension ScoreView {
    enum Constants {
        enum GpaLabel {
            static let text = "GPA - 4.0"
            static let textFontSize: CGFloat = 16
            static let gpaTextColour: UIColor = .white
            static let gpaValueColor = UIColor(hex: "FFC44A")
            static let gpaLabelTop: CGFloat = 20
            static let gpaLabelLeading: CGFloat = 18
            static let gpaLabelWidth: CGFloat = 82
            static let gpaLabelCornerRadius: CGFloat = 16
        }
        
        enum DetailLabel {
            static let textColor: UIColor = .white
            static let text = "დეტალურად"
            static let backgroundColor: UIColor = .clear
            static let font: UIFont = .systemFont(ofSize: 16)
            static let topAnchor: CGFloat = 21
            static let bottomAnchor: CGFloat = -21
            static let trailing: CGFloat = -4
        }
        
        enum GpaVectorImage {
            static let image = UIImage(named: "Polygon")
            static let top: CGFloat = 30
            static let leading: CGFloat = 4
            static let trailing: CGFloat = -34
        }
    }
}
