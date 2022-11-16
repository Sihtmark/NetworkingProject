//
//  ViewController.swift
//  NetworkingProject
//
//  Created by Sergei Poluboiarinov on 2022-11-16.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var dataSourse = [Profile]()
    let tableView = UITableView()
    let refreshControl = UIRefreshControl()
    var profileManager: ProfileManageable = ProfileManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupTableView()
    }

    private func setupTableView() {
        tableView.backgroundColor = .tintColor
//        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.reuseID)
        tableView.rowHeight = ProfileCell.rowHeight
        tableView.tableFooterView = UIView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func fetchData() {
        profileManager.fetchProfile { result in
            switch result {
            case .success(let profiles):
                self.dataSourse = profiles
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(.serverError):
                print("Server Error")
            case .failure(.decodingError):
                print("Decoding Error")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
        let post = dataSourse[indexPath.row]
        cell.userIdLabel.text = String(post.userId)
        cell.idLabel.text = String(post.id)
        cell.titleLabel.text = post.title
        return cell
    }
}


