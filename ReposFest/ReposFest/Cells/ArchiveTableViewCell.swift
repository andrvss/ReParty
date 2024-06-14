//
//  ArchiveTableViewCell.swift
//  ReposFest
//
//  Created by Paulo Andres Gonzales De Oliveira on 20/05/24.
//

import UIKit

class ArchiveTableViewCell: UITableViewCell {
    
    private lazy var archiveTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var archiveRepoDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    func configCell(archive: Archive) {
        archiveTitleLabel.text = archive.title
        archiveRepoDescription.text = archive.description
    }
    
    private func addSubViews() {
        contentView.addSubview(archiveTitleLabel)
        contentView.addSubview(archiveRepoDescription)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            archiveTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            archiveTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            archiveTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            archiveRepoDescription.topAnchor.constraint(equalTo: archiveTitleLabel.bottomAnchor, constant: 10),
            archiveRepoDescription.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            archiveRepoDescription.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -12)
            
        ])
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
