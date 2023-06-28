//
//  SubjectPageViewController.swift
//  QuizApp
//
//  Created by tornike ivanashvili on 26.06.23.
//

import UIKit

class SubjectPageViewController: UIViewController {
    
    private lazy var subjectPageTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SubjectPageTableViewCell.self, forCellReuseIdentifier: Constants.TableViewCell.cellIdentifier)
        return tableView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.UserNameLabel.font
        label.textColor = Constants.UserNameLabel.textColor
        label.text = Constants.UserNameLabel.text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let gpaButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Constants.GpaButton.backgroundColor
        button.layer.cornerRadius = Constants.GpaButton.cornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let gpaButtonVectorImage: UIImageView = {
        let image = UIImageView()
        image.image = Constants.GpaButton.image
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let gpaLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.GpaTextLabel.text
        label.textColor = Constants.GpaTextLabel.textColor
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.DetailLabel.text
        label.textColor = Constants.DetailLabel.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let chooseSubjectLabel: UILabel = {
        let chooseSubjectLabel = UILabel()
        chooseSubjectLabel.text = Constants.ChooseSubjectLabel.text
        chooseSubjectLabel.textColor = Constants.ChooseSubjectLabel.textColor
        chooseSubjectLabel.font = Constants.ChooseSubjectLabel.font
        chooseSubjectLabel.backgroundColor = Constants.ChooseSubjectLabel.backgroundColor
        chooseSubjectLabel.translatesAutoresizingMaskIntoConstraints = false
        return chooseSubjectLabel
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.LineView.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logOutButton: UIButton  = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(Constants.LogOutButton.image, for: .normal)
        button.layer.cornerRadius = Constants.LogOutButton.cornerRadius
        return button
    }()
    
    //MARK: Properties
    
    let subjects: [Subject] = [
        Subject(icon: "Globe", name: "გეოგრაფია", description: "აღწერა"),
        Subject(icon: "programming", name: "პროგრამირემა", description: "აღწერა"),
        Subject(icon: "Book", name: "ისტორია", description: "აღწერა"),
        Subject(icon: "Atom", name: "ფიზიკა", description: "აღწერა"),
        Subject(icon: "Atom", name: "ფიზიკა", description: "აღწერა"),
        Subject(icon: "Atom", name: "ფიზიკა", description: "აღწერა"),
        Subject(icon: "Atom", name: "ფიზიკა", description: "აღწერა"),
        Subject(icon: "Atom", name: "ფიზიკა", description: "აღწერა"),
        Subject(icon: "Atom", name: "ფიზიკა", description: "აღწერა"),
        Subject(icon: "Atom", name: "ფიზიკა", description: "აღწერა"),
        Subject(icon: "Atom", name: "ფიზიკა", description: "აღწერა")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupUserNameLabelConstraints()
        setupGpaButtonConstraints()
        setupGpaButtonVectorImageConstraints()
        setupGpaLabelConstraints()
        setupDetailLabelConstraints()
        setupChooseSubjectLabelConstraints()
        setupLogOutButtonConstraints()
        setupLineViewConstraints()
        setupTableViewConstraints()
    }
    
    // MARK: Constraints Setup
    private func setupTableViewConstraints() {
        view.addSubview(subjectPageTableView)
        NSLayoutConstraint.activate([
            subjectPageTableView.topAnchor.constraint(equalTo: chooseSubjectLabel.bottomAnchor),
            subjectPageTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            subjectPageTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subjectPageTableView.bottomAnchor.constraint(equalTo: lineView.topAnchor)
        ])
    }
    private func setupUserNameLabelConstraints() {
        view.addSubview(userNameLabel)
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.UserNameLabel.leading),
            userNameLabel.heightAnchor.constraint(equalToConstant: Constants.UserNameLabel.height)
        ])
    }
    
    private func setupGpaButtonConstraints() {
        view.addSubview(gpaButton)
        NSLayoutConstraint.activate([
            gpaButton.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: Constants.GpaButton.topAnchor),
            gpaButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.GpaButton.leadingAnchor),
            gpaButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.GpaButton.trailingAnchor),
            gpaButton.heightAnchor.constraint(equalToConstant: Constants.GpaButton.heightAnchor)
        ])
    }
    
    private func setupGpaButtonVectorImageConstraints() {
        gpaButton.addSubview(gpaButtonVectorImage)
        NSLayoutConstraint.activate([
            gpaButtonVectorImage.topAnchor.constraint(equalTo: gpaButton.topAnchor, constant: Constants.GpaButtonVectorImage.top),
            gpaButtonVectorImage.bottomAnchor.constraint(equalTo: gpaButton.bottomAnchor, constant: Constants.GpaButtonVectorImage.bottom),
            gpaButtonVectorImage.trailingAnchor.constraint(equalTo: gpaButton.trailingAnchor, constant: Constants.GpaButtonVectorImage.trailing),
            gpaButtonVectorImage.heightAnchor.constraint(equalToConstant: Constants.GpaButtonVectorImage.height),
            gpaButtonVectorImage.widthAnchor.constraint(equalToConstant: Constants.GpaButtonVectorImage.width)
        ])
    }
    
    private func setupGpaLabelConstraints() {
        gpaButton.addSubview(gpaLabel)
        NSLayoutConstraint.activate([
            gpaLabel.topAnchor.constraint(equalTo: gpaButton.topAnchor, constant: Constants.GpaTextLabel.topAnchor),
            gpaLabel.bottomAnchor.constraint(equalTo: gpaButton.bottomAnchor, constant: Constants.GpaTextLabel.bottomAnchor),
            gpaLabel.leadingAnchor.constraint(equalTo: gpaButton.leadingAnchor, constant: Constants.GpaTextLabel.leadingAnchor)
        ])
    }
    
    private func setupDetailLabelConstraints() {
        gpaButton.addSubview(detailLabel)
        NSLayoutConstraint.activate([
            detailLabel.trailingAnchor.constraint(equalTo: gpaButtonVectorImage.leadingAnchor, constant: Constants.DetailLabel.trailing),
            detailLabel.centerYAnchor.constraint(equalTo: gpaButton.centerYAnchor)
        ])
    }
    
    private func setupChooseSubjectLabelConstraints() {
        view.addSubview(chooseSubjectLabel)
        NSLayoutConstraint.activate([
            chooseSubjectLabel.topAnchor.constraint(equalTo: gpaButton.bottomAnchor, constant: Constants.ChooseSubjectLabel.topAnchor),
            chooseSubjectLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.ChooseSubjectLabel.leadingAnchor),
        ])
    }
    
    private func setupLineViewConstraints() {
        view.addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: Constants.LineView.height),
            lineView.bottomAnchor.constraint(equalTo: logOutButton.topAnchor, constant: Constants.LineView.bottom)
        ])
    }
    
    private func setupLogOutButtonConstraints() {
        view.addSubview(logOutButton)
        NSLayoutConstraint.activate([
            logOutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.LogOutButton.bottomAnchor),
            logOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.LogOutButton.trailingAnchor),
            logOutButton.widthAnchor.constraint(equalToConstant: Constants.LogOutButton.widthAnchor),
            logOutButton.heightAnchor.constraint(equalToConstant: Constants.LogOutButton.heightAnchor)
        ])
    }

}

extension SubjectPageViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight = Constants.TableViewCell.cellHeight
        let distanceBetweenCells = Constants.TableViewCell.distanceBetweenCells
        return cellHeight + distanceBetweenCells
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCell.cellIdentifier, for: indexPath) as! SubjectPageTableViewCell
        let subject = subjects[indexPath.row]
        cell.configure(with: subject)
        return cell
    }
}

// MARK: - Constants
private extension SubjectPageViewController {
    enum Constants {
        enum DetailLabel {
            static let textColor: UIColor = .white
            static let text = "დეტალურად"
            static let backgroundColor: UIColor = .clear
            static let font: UIFont = .systemFont(ofSize: 16)
            static let topAnchor: CGFloat = 21
            static let bottomAnchor: CGFloat = -21
            static let trailing: CGFloat = -4
        }
        
        enum GpaButton {
            static let image = UIImage(named: "Polygon")
            static let backgroundColor = UIColor(hex: "537FE7")
            static let cornerRadius: CGFloat = 26
            static let topAnchor: CGFloat = 20
            static let leadingAnchor: CGFloat = 16
            static let trailingAnchor: CGFloat = -16
            static let widthAnchor: CGFloat = 88
            static let heightAnchor: CGFloat = 75
        }
        
        enum GpaButtonVectorImage {
            static let top: CGFloat = 32
            static let bottom: CGFloat = -30
            static let height: CGFloat = 10
            static let trailing: CGFloat = -34
            static let width: CGFloat = 14
        }
        
        enum GpaTextLabel {
            static let text = "GPA -"
            static let backgroundColor: UIColor = .clear
            static let textColor: UIColor = .white
            static let font: UIFont = .systemFont(ofSize: 16)
            static let topAnchor: CGFloat = 6
            static let bottomAnchor: CGFloat = -6
            static let leadingAnchor: CGFloat = 18
        }
        
        enum ChooseSubjectLabel {
            static let text = "აირჩიე საგანი"
            static let font: UIFont = .systemFont(ofSize: 16)
            static let topAnchor: CGFloat = 32
            static let leadingAnchor: CGFloat = 16
            static let textColor: UIColor = .black
            static let backgroundColor: UIColor = .clear
        }
        
        enum LogOutButton {
            static let image = UIImage(named: "Logout")
            static let cornerRadius: CGFloat = 21
            static let widthAnchor: CGFloat = 42
            static let heightAnchor: CGFloat = 42
            static let trailingAnchor: CGFloat = -16
            static let bottomAnchor: CGFloat = -14
        }
        
        enum TableView {
            static let bottomAnchor: CGFloat = 0
        }
        
        enum TableViewCell {
            static let cellHeight: CGFloat = 108
            static let distanceBetweenCells: CGFloat = 18
            static let cellIdentifier = "SubjectPageTableViewCell"
        }
        
        enum UserNameLabel {
            static let text = "გამარჯობა,ირაკლი"
            static let font = UIFont(name: "MyriadGEO", size: 16)
            static let textColor = UIColor(hex: "FFC44A")
            static let leading: CGFloat = 16
            static let height: CGFloat = 21
        }
        
        enum LineView {
            static let height: CGFloat = 1
            static let color = UIColor(hex: "F1F1F1")
            static let bottom: CGFloat = -12
        }
    }
}
