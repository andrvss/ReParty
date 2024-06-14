//
//  RepoDetailsCollectionViewCell.swift
//  ReposFest
//
//  Created by Paulo Andres Gonzales De Oliveira on 13/06/24.
//

import UIKit

class RepoDetailsCollectionViewCell: UICollectionViewCell {
    
    private lazy var repoTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10.0, weight: .medium)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    private lazy var repoDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12.0, weight: .medium)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.borderWidth = 1.5
        layer.borderColor = UIColor.gray.cgColor
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(archivesRepo: Issues) {
        repoTitle.text = archivesRepo.title
        repoDescription.text = archivesRepo.description
    }
    
    private func addSubViews() {
        contentView.addSubview(repoTitle)
        contentView.addSubview(repoDescription)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            repoTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            repoTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            repoTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 12),
            
            repoDescription.topAnchor.constraint(equalTo: repoTitle.bottomAnchor, constant: 10),
            repoDescription.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            repoDescription.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            repoDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
}
