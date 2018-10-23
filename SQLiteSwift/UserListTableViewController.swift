//
//  UserListTableViewController.swift
//  SQLiteSwift
//
//  Created by Vitor Mendes on 23/10/18.
//  Copyright © 2018 Vitor Mendes. All rights reserved.
//

import UIKit
import SQLite3

class UserListTableViewController : UITableViewController,UpdateList{
    
    var users = [User]()
    
    override func viewDidLoad() {
        tableView.backgroundColor = UIColor.white
        title = "Listagem"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(performAdd))
        getData()
    }
    
    func getData()
    {
        let userDB = UserDB()
        users = userDB.list() ?? []
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text = users[indexPath.row].nome
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
}

extension UserListTableViewController
{
    @objc func performAdd()
    {
        let controller = UserCadViewController()
        controller.delegate = self
        let navigationController = UINavigationController(rootViewController: controller)
        present(navigationController, animated: true)
    }
}
