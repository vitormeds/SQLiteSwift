//
//  UserListTableViewController.swift
//  SQLiteSwift
//
//  Created by Vitor Mendes on 23/10/18.
//  Copyright © 2018 Vitor Mendes. All rights reserved.
//

import UIKit
import SQLite3

fileprivate let reuseIdentifierCell = "Cell"

class UserListTableViewController : UITableViewController,UpdateList{
    
    var users = [User]()
    
    override func viewDidLoad() {
        tableView.backgroundColor = UIColor.white
        title = "Listagem"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(performAdd))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UserViewCell.self, forCellReuseIdentifier: reuseIdentifierCell)
        getData()
    }
    
    func getData()
    {
        let userDB = UserDB()
        users = userDB.list() ?? []
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let editAction = UITableViewRowAction(style: .normal, title: "Editar") { (rowAction, indexPath) in
            let controller = UserCadViewController()
            controller.isEdit = true
            controller.user = self.users[indexPath.row]
            controller.delegate = self
            let navigationController = UINavigationController(rootViewController: controller)
            self.present(navigationController, animated: true)
        }
        editAction.backgroundColor = .blue
        
        let deleteAction = UITableViewRowAction(style: .normal, title: "Deletar") { (rowAction, indexPath) in
            let userDB = UserDB()
            userDB.delete(id: self.users[indexPath.row].id)
            self.users.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        deleteAction.backgroundColor = .red
        
        return [deleteAction,editAction]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCell, for: indexPath) as! UserViewCell
        cell.id = users[indexPath.row].id
        cell.nomeLabel.text = users[indexPath.row].nome
        cell.enderecoLabel.text = users[indexPath.row].endereco
        cell.telefoneLabel.text = users[indexPath.row].telefone
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
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
