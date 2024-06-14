//
//  FoundViewController.swift
//  ReposFest
//
//  Created by Paulo Andres Gonzales De Oliveira on 17/05/24.
//

import UIKit

class FoundViewController: UIViewController {
    
    private var filteredRepos: [Archive] = []
    // verifica quais serão os repositórios que estão na lista.
    private var isSearchActive: Bool = false
    // para confirmar que a pesquisa só será ativa, se o usuário digitar algum valor.
    
    private lazy var searchInput: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Buscar"
        searchBar.searchTextField.backgroundColor = .background
        searchBar.layer.cornerRadius = 13
        searchBar.layer.borderWidth = 1.5
        searchBar.layer.borderColor = UIColor.black.cgColor
        searchBar.delegate = self
        return searchBar
    }()
    
    private lazy var tableViewList: UITableView = {
        let tableViewList = UITableView()
        tableViewList.translatesAutoresizingMaskIntoConstraints = false
        tableViewList.dataSource = self
        tableViewList.delegate = self
        tableViewList.register(ArchiveTableViewCell.self, forCellReuseIdentifier: "archivesCell")
        return tableViewList
        // TB que será usada para informar os repositórios.
        // Os metódos estão sendo apenas implementados.
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubViews()
        setupConstraints()
        navigationBarProperties()
        // Necessário checar questão de concatenação de strings no title.
    }
    
    private func navigationBarProperties() {
        title = "Repositórios de octocat"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.black
        ]
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func addSubViews() {
        view.addSubview(tableViewList)
        view.addSubview(searchInput)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            searchInput.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            searchInput.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            searchInput.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            searchInput.heightAnchor.constraint(equalToConstant: 40),
            
            tableViewList.topAnchor.constraint(equalTo: searchInput.bottomAnchor, constant: 10),
            tableViewList.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewList.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            tableViewList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}

extension FoundViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearchActive ? filteredRepos.count : archives.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "archivesCell", for: indexPath) as? ArchiveTableViewCell {
            let archive = isSearchActive ? filteredRepos[indexPath.row] : archives[indexPath.row]
            cell.configCell(archive: archive)
            return cell
            // verifica se o dequeue recebe o objeto correto
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewList.deselectRow(at: indexPath, animated: true)
        let archive = isSearchActive ? filteredRepos[indexPath.row] : archives[indexPath.row]
        let detailsVC = RepoDetailsViewController(archives: archive)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
}

extension FoundViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearchActive = false
            // a barra de pesquisa fica inativa, caso esteja vazia!
        } else {
            isSearchActive = true
            filteredRepos = archives.filter({ Archive in
                Archive.title.lowercased().contains(searchText.lowercased())
                // retorna o filtered repos cada elemento que está cumprindo com a condição de todo valor digitado,tudo em letras minusculas!
            })
        }
        tableViewList.reloadData()
        // para recarregar toda vez que um valor for digitado
    }
}
