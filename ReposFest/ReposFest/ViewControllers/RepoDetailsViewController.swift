//
//  RepoDetailsViewController.swift
//  ReposFest
//
//  Created by Paulo Andres Gonzales De Oliveira on 06/06/24.
//

import UIKit

class RepoDetailsViewController: UIViewController {
    
    private var archives: Archive
    
    init(archives: Archive) {
        self.archives = archives
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubView()
        setupConstraints()
        navigationBarProperties()
    }
    
    private func navigationBarProperties() {
        title = "Informações de boysenberry-repo-1"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.black
        ]
        navigationController?.navigationBar.tintColor = .black
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileImageView, label, sublabel, issues, UIView(), stackViewTwo])
        stackView.backgroundColor = .background
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 110, height: 110))
        imageView.image = UIImage(named: "Image")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "octocat"
        label.textColor = .black
        label.font = .systemFont(ofSize: 32, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sublabel: UILabel = {
        let secondlabel = UILabel()
        secondlabel.text = "boysenberry-repo-1"
        secondlabel.textColor = .black
        secondlabel.font = .systemFont(ofSize: 17, weight: .regular)
        secondlabel.numberOfLines = 0
        secondlabel.textAlignment = .center
        secondlabel.translatesAutoresizingMaskIntoConstraints = false
        return secondlabel
    }()
    
    private lazy var issues: UILabel = {
        let issues = UILabel()
        issues.text = "issues: 123"
        issues.textColor = .black
        issues.font = .systemFont(ofSize: 15, weight: .regular)
        issues.numberOfLines = 0
        issues.textAlignment = .center
        issues.translatesAutoresizingMaskIntoConstraints = false
        return issues
    }()
    
    private lazy var stackViewTwo: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [collectionView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 25
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 35, bottom: 10, right: 35)
        layout.itemSize = .init(width: 156, height: 100)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(RepoDetailsCollectionViewCell.self, forCellWithReuseIdentifier: "RepoDetailsCollectionViewCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .viewBackground
        return collectionView
    }()
    
    
    private func addSubView() {
        view.addSubview(stackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            
            profileImageView.heightAnchor.constraint(equalToConstant: 110),
            profileImageView.widthAnchor.constraint(equalToConstant: 110),
            
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
}

extension RepoDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return archivesRepo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RepoDetailsCollectionViewCell", for: indexPath) as? RepoDetailsCollectionViewCell {
            let archivesRepo = archivesRepo[indexPath.row]
            cell.configCell(archivesRepo: archivesRepo)
            return cell
        }
        return UICollectionViewCell()
    }
}

extension RepoDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: 120)
    }
}
